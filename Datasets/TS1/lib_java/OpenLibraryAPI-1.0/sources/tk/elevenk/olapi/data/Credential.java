package tk.elevenk.olapi.data;

/* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/data/Credential.class */
public class Credential {
    private String username;
    private String password;

    public Credential(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return this.username;
    }

    public String getPassword() {
        return this.password;
    }
}
