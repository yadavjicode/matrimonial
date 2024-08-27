import 'dart:developer';

import 'package:googleapis_auth/auth_io.dart';

class NotificationAccessToken {
  static String? _token;

  //to generate token only once for an app run
  static Future<String?> get getToken async => _token ?? await _getAccessToken();

  // to get admin bearer token
  static Future<String?> _getAccessToken() async {
    try {
      const fMessagingScope =
          'https://www.googleapis.com/auth/firebase.messaging';

      final client = await clientViaServiceAccount(
        // To get Admin Json File: Go to Firebase > Project Settings > Service Accounts
        // > Click on 'Generate new private key' Btn & Json file will be downloaded

        // Paste Your Generated Json File Content
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "we-chat-75f13",
          "private_key_id": "1a1621fe6a5374932428ae0f4a05782b7acccb14",
          "private_key":
              "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC6R/L0jOehSyDP\nFX8Sgq+E3HXtgLRppZHy5FQUmDB6pEPCCGG8gOnt/2GzFlIcAI0SSFt//JMwqGoD\n4I5BeV9oKSrmR8YFFllmQrazIL5Ynf9NrNB1pR0+UjAWfgU3O8f5ZclaG5HnFap/\nB93Jt6MatWDKQilnjPnFB+CxyWkXmKls3Qv4W1mot7JC+OoscLz13w9U/+plLZmF\ne9CS/Gynp8F1IlKbWJSEy8ltkHEhpzpm9RDrWD+trBbWHVnhuaOz7rqO4Ydts+TK\npNugK/ksL5B6SFtqZfkvsnZzR2tKh0VtLJLfH5I8tEGWJteli/0RqnRXhBruPrLa\nP4fZo3wxAgMBAAECggEAKa2z8R3+rGKyFEtXu2VEjqpB83IOy615JnqKSnJTtHkA\n1Q7JiWLhlDfF3QszM2M3LR5F5LC3IRWpZLUvNvyISXaei9gGuPgrZ/soxBLhK9Qr\n/W3bVVssXBeI/VtUYOuN/mHVB4VwI19AXrw8liexhWYMIizj9TCAaOJulnC9RAMo\ntxAu2Xt69vE+cIgPTUzf01fY7NXHVnQs3aXvuD3LfQVHQXwbU/BApSNCPn3Df4YQ\nAUQhSXGprEtDmF89d1sCg/v92DxXH22B/nqpUh51iLSzCW6QjUGy4YlwdJ0U/qhj\nRrefq6sC4dJgVcbmJyQkgyAdouZKA2niFfSHeVqXTQKBgQDx+He1kJCWlE2AOFAK\noTNlLSsJxjj6fRhcuxWykZCXvVP2xi+CfYFCN+n+ZDGhU3pi1NDJ8Twh4M7EFCM7\npGmhW7qDgiXqpB3R8lt3huH+3rPqP6z+2zDi+HxCJckpWpb32TorgkIdSRp3eM0s\n03kl0rB6xW59LMNMKBz2/mn5RQKBgQDFFOPp+u6MerJjjuVD9aWTzYuCON0z3DO/\n4bbGIP6vZ4SzmlYtdDHBcZp/ogLIgK4AGYNwWSap6kQVDV/6llxQu9uLtPpwkrza\n3BTKrSQdtu7tvdHWSu5cCqkWIz4hVEDpHWeXoFkg37GDVbK+CZdYOb2y5d2Bel/6\nYY2DoQ5H/QKBgB8Rt1VB5b7f9f+Tu3tR7YZ9QTx1DlXjgCBQCV4vYLCLJ9/U3L7V\nnKZDBbGbbd/4FwvfpZt4dS8obYQxzcBXwRRt8cn3CSVSw1100BfN4vDV6aYXXQAw\nZtuN6m6X6Xd84UubweNaS2D1RQe4JCgwUyrvHaf199TszXrW37k7O6I9AoGAVFxF\n1wEvnXhj5dPj9Xwv/R2N6xcWML3AdRFUIGk9O63vEsYsv1YueiR7wsiBsnvKf4Zs\nSeoPb8o0jGJmRCiaqYBQUPQOA6P8LR7p03vbqtCEY8XODZGTiFiT2kMJtFCRXHfW\nwQPFQxodrR9A3LHUU9KbjflxIJxWeyHI5qBJMa0CgYEAz2iWE5rNtJ1mLrsC/o8j\njDV0RHzhN2f2pAxLlXHJ40nvQ5Nbyk5gCI2llUTN73YPNJXcM6ZKARyzlx0cA0TE\nolbpV91lb5j2L2HLAz1nciOzh1IRCJRk7T7j01TrygOv2n6fyWfUGuHCR5lztaiv\nykRUUKoMSaezOlB88DIqTIQ=\n-----END PRIVATE KEY-----\n",
          "client_email":
              "firebase-adminsdk-9y8mc@we-chat-75f13.iam.gserviceaccount.com",
          "client_id": "115556782220674603906",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url":
              "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
              "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-9y8mc%40we-chat-75f13.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"

  // its my account service
  //    "type": "service_account",  
  // "project_id": "emotional-cbe85",
  // "private_key_id": "1e7d356953549120dd3e2e0a6e4e6dc80ffb1eee",
  // "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQChuR2TsobDntol\n2pUx8GoLYoS5aDu/I8RrfcDs4nW8lSPS7elzCkEh5VFxPwqwFG2I1Wu7qeZ2Owe+\nzE81iDsMIKsSXPXpZB8PfRd9LxqpYjf0xj8wW6KDxuc0EN5I+CsxyUXEpXgKG6wX\nrtK4e3wNSbrCMGNkm91smmfFd9JhvZGbaYJL+DgC4a2iIoti7KHnBUTM64HWUxkf\n4kWuY1ezKsK8HTbSkDH+EueeqNxOWAp6XyKqGQZ4tFmFwShL0RCbApz2R8PQwzsS\no3JAEOFrRVr+Ga1sxFoC/y5Ol0t+MsbgDN/0W2o9JAmqGc+CopFJuRaoxIsLyN6u\noPb9G0jVAgMBAAECggEAIs17C3deYAe163KEK+iQcZ3EcT/4p5QTZ4x68Z90dd5k\nhLZ1SC/7P0ehxKyr6KOkxM8k7ZBNC8F9U7aVDzCfgGchWYTO2OiWdJdXcDWsV6pO\n32qwW4BE03YA+Gfu5iYd6Ytma8CuOgKlgL07FL9iPVvSCIswQIz4VDBQR6MXD7hL\n43auW5mscdUIhKLPAOYG10g+WE7l3OYAOyWf8DrlU466Dto8Jy3q4m458gULc7oJ\nn5CJJnd4jUGRsMnDNLGtP/lwC+2TcSogplHLxT1hNMaDGTr02r7a0x2YTDPX5BVj\ne9CLnp1lA26Ulxx4m0BTXSWwjycLJpwaOxH8BgzAQQKBgQDMNxuSjCH54qJV2IEU\nbbKIwYnjtEs8i1jerC8BOz2xZ3wR9ZYJkPWYp8ANgWpEK9hbTKRk/et+MEi8GlxD\nCttNibEnMHUpyfSzOF0dBjy5wamXdP83cSVjlQ28IYoOo/UMYnx6w0qAlSl2M4Ci\ntxZUF4Zgswt6d3HyOAps44znYQKBgQDKu5Ng36WYhTvcTLu1kV2kxXodja5KJJ3e\n+9bcaGwqz8nHkocV/yQM2zMpZUds7eCwUgCcfdW3Bywq0DoH4zybv6tT7oHPxNVz\nJIiaPMHp49yfGd6tYwIa3oLi+3fgTuxRU3FidPrPl/6kPao7xB2xthFj0WivL0a+\nl1j+uQV59QKBgBnCndTHnoWSBB5GGEpGaC3+E/HITXFOtqAoIinKmkaloi31x75f\nLcva5UwO1iPRUBJ8QYSHz0v0tUgdHyRJ204Vn2YtI6po0lhFNOGzZreb6VO0q3kH\n6cp9A+WGaY7dOc0dI0ytE9nSdw91AbYE2Gk1KntKOplxNctzLEV+EskhAoGBAKLj\nvdG7QIFgo60pFjUXvGb0qF5whRZbf2E3dfaYDDkFxTmOGO3ql1uhD+V108LJCpyA\n9q7GSF4L7EfmEIpf4UW+5fjFDRYUL/CY7Q0IPkIf7BcFoS4s+/b8y6t2o2Xd4/Cg\nG90g4pjDpjzuswXcWIN+J1DNY9BGKxBd6IqZvLW1AoGAAx0/GN7sIxL7toGrPJC6\nLsEbf+fqKy+WGmb0oxKBRyNd3Uvt0JShJOkEP/vJYtvFWSyzDrLWb/Y3ZC1rU9Es\naB2taavxB+FFxH5F4aWmmnII1aYxEw8MzEWpeqI91oaqL71NlTq+zxOmVbtZQL6n\nJwnsSbxob4SRkZ1PJLo8EWk=\n-----END PRIVATE KEY-----\n",
  // "client_email": "firebase-adminsdk-zl2ud@emotional-cbe85.iam.gserviceaccount.com",
  // "client_id": "103089092218124641859",
  // "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  // "token_uri": "https://oauth2.googleapis.com/token",
  // "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  // "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-zl2ud%40emotional-cbe85.iam.gserviceaccount.com",
  // "universe_domain": "googleapis.com"
  
        }),
        [fMessagingScope],
      );

      _token = client.credentials.accessToken.data;

      return _token;
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
