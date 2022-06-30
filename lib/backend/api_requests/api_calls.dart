import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class AirtableCall {
  static Future<ApiCallResponse> call({
    String? user = '',
    String? issue = '',
    String? room = '',
    String? building = '',
    String? status = '',
    String? created = '',
    String? updated = '',
    String? name = '',
    String? links = '',
  }) {
    final body = '''
{
  "fields": {
    "User": "${user}",
    "Issue": "${issue}",
    "Building": "${building}",
    "Room": "${room}",
    "Status": "${status}",
    "Name": "${name}",
    "Links": "${links}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Airtable',
      apiUrl: 'https://api.airtable.com/v0/app9bz66rDGXHbZng/Maintenance',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer keySJ3Ga07JDprE4a',
      },
      params: {
        'User': user,
        'Issue': issue,
        'Room': room,
        'Building': building,
        'Status': status,
        'Created': created,
        'Updated': updated,
        'Name': name,
        'Links': links,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class SendGridCall {
  static Future<ApiCallResponse> call({
    String? toEmail = '2188162@students.wits.ac.za',
    String? subject = 'Re: Maintenance',
    String? content = 'Dynanmic link',
    String? name = '',
  }) {
    final body = '''
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${toEmail}"
        }
      ],
      "subject": "${subject}"
    }
  ],
  "content": [
    {
      "type": "text/plain",
      "value": "${content}"
    }
  ],
  "from": {
    "email": "campusafricapp@gmail.com",
    "name": "admin"
  },
  "reply_to": {
    "email": "campusafricapp@gmail.com",
    "name": "admin"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendGrid',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {
        'toEmail': toEmail,
        'subject': subject,
        'content': content,
        'name': name,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
