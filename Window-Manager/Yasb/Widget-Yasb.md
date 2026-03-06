# Widget-Yasb.md

# Ai Chat

* [AI Chat Widget](https://docs.yasb.dev/latest/widgets/ai-chat)

## ChatGPT: "get credential from api.openai.com"

To get API credentials from OpenAI, follow these steps:

1. Go to the OpenAI platform
   Visit **[https://platform.openai.com/](https://platform.openai.com/)** (this is the developer dashboard for OpenAI).

2. Sign in or create an account

   * If you already have an account, log in.
   * Otherwise, sign up and verify your email/phone.

3. Open the API keys page
   After logging in, go to:
   **Dashboard → API Keys**
   Direct link: [https://platform.openai.com/api-keys](https://platform.openai.com/api-keys)

4. Create a new secret key

   * Click **“Create new secret key.”**
   * Copy the key immediately and store it securely (you won’t be able to see it again).

5. Use the key in your app
   Example (Python):

   ```python
   from openai import OpenAI
   client = OpenAI(api_key="your_api_key_here")
   ```

⚠️ Important security tips:

* Never share your API key publicly.
* Don’t commit it to GitHub.
* Use environment variables in production.

If you want, I can show how to set it up in Node.js, Python, or a .env file.
