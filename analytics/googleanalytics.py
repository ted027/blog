# -*- coding: utf-8 -*-
import json
import falcon
from analytics import Analytics


class HelloResource(object):
    def on_get(self, req, resp):
        analytics = Analytics()
        scope = ['https://www.googleapis.com/auth/analytics.readonly']

        service_account_email = "analytics@lively-fold-241407.iam.gserviceaccount.com"
        key_file_location = './k.p12'

        # apiの呼び出し・結果出力
        service = analytics.get_service(
            'analytics', 'v3', scope, key_file_location, service_account_email)
        profile = analytics.get_first_profile_id(service)
        resp.body = json.dumps({
            "rows":
            analytics.get_json(
                analytics.get_rankings_results(service, profile))
        })


app = falcon.API()
app.add_route("/", HelloResource())

if __name__ == "__main__":
    from wsgiref import simple_server
    httpd = simple_server.make_server("127.0.0.1", 3000, app)
    httpd.serve_forever()