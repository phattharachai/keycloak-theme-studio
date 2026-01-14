<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #E5E7EB;
            margin: 0;
            padding: 0;
        }
        .email-container {
            max-width: 600px;
            margin: 40px auto;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .email-header {
            background: linear-gradient(135deg, #3B82F6 0%, #2563EB 100%);
            color: white;
            padding: 40px 30px;
            text-align: center;
        }
        .email-header h1 {
            margin: 0;
            font-size: 28px;
            font-weight: 700;
        }
        .email-body {
            padding: 40px 30px;
            color: #2C3E50;
            line-height: 1.6;
        }
        .email-button {
            display: inline-block;
            background-color: #3B82F6;
            color: white;
            padding: 14px 32px;
            text-decoration: none;
            border-radius: 12px;
            font-weight: 600;
            margin: 20px 0;
            transition: all 0.3s ease;
        }
        .email-button:hover {
            background-color: #2563EB;
        }
        .email-footer {
            background-color: #E5E7EB;
            padding: 30px;
            text-align: center;
            color: #6B7280;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <div class="email-header">
            <h1>🍰 Softcakes</h1>
        </div>
        <div class="email-body">
            ${kcSanitize(body)?no_esc}
        </div>
        <div class="email-footer">
            <p>&copy; ${.now?string('yyyy')} Softcakes. All rights reserved.</p>
        </div>
    </div>
</body>
</html>
