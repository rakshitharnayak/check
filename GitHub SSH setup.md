# Follow the below steps
1. Enter terminal
2. Type `ssh-keygen -t ed25519 -C "your_email@example.com"`
3. Press Enter when asked for file directory and password
4. Type `cat ~/.ssh/id_ed25519.pub` and copy the contents of the output
5. Type the following URL in your web browser:
https://github.com/settings/keys
6. Click on **New SSH key**
![[Screenshot_20240212-115950.png]]
8. Save the name of the key as Mirafra Server Access Key ![[Screenshot_20240212-121452.png]] Paste the contents from terminal output into the *key* box. After that, click **Add SSH key**.