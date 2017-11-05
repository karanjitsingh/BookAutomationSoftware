
namespace BookAutomationSoftware
{
    public enum AccessLevel
    {
        Any,
        Employee,
        Manager
    }

    public class LoginSession
    {
        public readonly string user = "";
        public readonly string username = "";
        public readonly AccessLevel accessLevel = 0;
        public readonly bool loggedIn = false;

        public LoginSession(string user, string username, AccessLevel access)
        {
            this.user = user;
            this.username = username;
            this.accessLevel = access;
            loggedIn = true;
        }

        public LoginSession()
        {
        }
    }
}