package org.kore.kolab.notes;

import java.io.Serializable;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/AccountInformation.class */
public final class AccountInformation implements Serializable {
    private String username;
    private String password;
    private final String host;
    private int port = 993;
    private boolean sslEnabled = true;
    private boolean folderAnnotationEnabled = true;
    private boolean sharedFoldersEnabled = false;

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/AccountInformation$Builder.class */
    public interface Builder {
        AccountInformation build();

        Builder disableSSL();

        Builder disableFolderAnnotation();

        Builder enableSharedFolders();

        Builder port(int i);
    }

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/AccountInformation$Password.class */
    public interface Password {
        Builder password(String str);
    }

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/AccountInformation$Username.class */
    public interface Username {
        Password username(String str);
    }

    private AccountInformation(String host) {
        this.host = host;
    }

    public static final Username createForHost(String host) {
        AccountInformation accountInformation = new AccountInformation(host);
        accountInformation.getClass();
        return accountInformation.new DefaultBuilder();
    }

    public boolean isFolderAnnotationEnabled() {
        return this.folderAnnotationEnabled;
    }

    public String getUsername() {
        return this.username;
    }

    public String getPassword() {
        return this.password;
    }

    public String getHost() {
        return this.host;
    }

    public int getPort() {
        return this.port;
    }

    public boolean isSSLEnabled() {
        return this.sslEnabled;
    }

    public boolean isSharedFoldersEnabled() {
        return this.sharedFoldersEnabled;
    }

    public String toString() {
        return "AccountInformation{username=" + this.username + ", password=" + this.password + ", host=" + this.host + ", port=" + this.port + ", sslEnabled=" + this.sslEnabled + ", folderAnnotationEnabled=" + this.folderAnnotationEnabled + ", sharedFoldersEnabled=" + this.sharedFoldersEnabled + '}';
    }

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/AccountInformation$DefaultBuilder.class */
    class DefaultBuilder implements Builder, Password, Username {
        DefaultBuilder() {
        }

        @Override // org.kore.kolab.notes.AccountInformation.Builder
        public AccountInformation build() {
            return AccountInformation.this;
        }

        @Override // org.kore.kolab.notes.AccountInformation.Builder
        public Builder disableSSL() {
            AccountInformation.this.sslEnabled = false;
            return this;
        }

        @Override // org.kore.kolab.notes.AccountInformation.Builder
        public Builder disableFolderAnnotation() {
            AccountInformation.this.folderAnnotationEnabled = false;
            return this;
        }

        @Override // org.kore.kolab.notes.AccountInformation.Builder
        public Builder port(int port) {
            AccountInformation.this.port = port;
            return this;
        }

        @Override // org.kore.kolab.notes.AccountInformation.Builder
        public Builder enableSharedFolders() {
            AccountInformation.this.sharedFoldersEnabled = true;
            return this;
        }

        @Override // org.kore.kolab.notes.AccountInformation.Password
        public Builder password(String password) {
            AccountInformation.this.password = password;
            return this;
        }

        @Override // org.kore.kolab.notes.AccountInformation.Username
        public Password username(String user) {
            AccountInformation.this.username = user;
            return this;
        }
    }
}
