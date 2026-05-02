package com.sun.mail.smtp;

import com.sun.mail.auth.OAuth2SaslClientFactory;
import com.sun.mail.util.ASCIIUtility;
import com.sun.mail.util.BASE64DecoderStream;
import com.sun.mail.util.BASE64EncoderStream;
import com.sun.mail.util.MailLogger;
import java.util.Properties;
import java.util.logging.Level;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.NameCallback;
import javax.security.auth.callback.PasswordCallback;
import javax.security.sasl.RealmCallback;
import javax.security.sasl.RealmChoiceCallback;
import javax.security.sasl.Sasl;
import javax.security.sasl.SaslClient;
import javax.security.sasl.SaslException;
import korex.mail.MessagingException;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/smtp/SMTPSaslAuthenticator.class */
public class SMTPSaslAuthenticator implements SaslAuthenticator {
    private SMTPTransport pr;
    private String name;
    private Properties props;
    private MailLogger logger;
    private String host;

    static {
        try {
            OAuth2SaslClientFactory.init();
        } catch (Throwable th) {
        }
    }

    public SMTPSaslAuthenticator(SMTPTransport pr, String name, Properties props, MailLogger logger, String host) {
        this.pr = pr;
        this.name = name;
        this.props = props;
        this.logger = logger;
        this.host = host;
    }

    @Override // com.sun.mail.smtp.SaslAuthenticator
    public boolean authenticate(String[] mechs, final String realm, String authzid, final String u, final String p) throws MessagingException {
        int resp;
        String qop;
        boolean done = false;
        if (this.logger.isLoggable(Level.FINE)) {
            this.logger.fine("SASL Mechanisms:");
            for (String str : mechs) {
                this.logger.fine(" " + str);
            }
            this.logger.fine("");
        }
        CallbackHandler cbh = new CallbackHandler() { // from class: com.sun.mail.smtp.SMTPSaslAuthenticator.1
            @Override // javax.security.auth.callback.CallbackHandler
            public void handle(Callback[] callbacks) {
                if (SMTPSaslAuthenticator.this.logger.isLoggable(Level.FINE)) {
                    SMTPSaslAuthenticator.this.logger.fine("SASL callback length: " + callbacks.length);
                }
                for (int i = 0; i < callbacks.length; i++) {
                    if (SMTPSaslAuthenticator.this.logger.isLoggable(Level.FINE)) {
                        SMTPSaslAuthenticator.this.logger.fine("SASL callback " + i + ": " + callbacks[i]);
                    }
                    if (callbacks[i] instanceof NameCallback) {
                        NameCallback ncb = (NameCallback) callbacks[i];
                        ncb.setName(u);
                    } else if (callbacks[i] instanceof PasswordCallback) {
                        PasswordCallback pcb = (PasswordCallback) callbacks[i];
                        pcb.setPassword(p.toCharArray());
                    } else if (callbacks[i] instanceof RealmCallback) {
                        RealmCallback rcb = (RealmCallback) callbacks[i];
                        rcb.setText(realm != null ? realm : rcb.getDefaultText());
                    } else if (callbacks[i] instanceof RealmChoiceCallback) {
                        RealmChoiceCallback rcb2 = (RealmChoiceCallback) callbacks[i];
                        if (realm == null) {
                            rcb2.setSelectedIndex(rcb2.getDefaultChoice());
                        } else {
                            String[] choices = rcb2.getChoices();
                            int k = 0;
                            while (true) {
                                if (k >= choices.length) {
                                    break;
                                }
                                if (!choices[k].equals(realm)) {
                                    k++;
                                } else {
                                    rcb2.setSelectedIndex(k);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        };
        try {
            SaslClient sc = Sasl.createSaslClient(mechs, authzid, this.name, this.host, this.props, cbh);
            if (sc == null) {
                this.logger.fine("No SASL support");
                throw new UnsupportedOperationException("No SASL support");
            }
            if (this.logger.isLoggable(Level.FINE)) {
                this.logger.fine("SASL client " + sc.getMechanismName());
            }
            try {
                String mech = sc.getMechanismName();
                String ir = null;
                if (sc.hasInitialResponse()) {
                    byte[] ba = sc.evaluateChallenge(new byte[0]);
                    if (ba.length > 0) {
                        byte[] ba2 = BASE64EncoderStream.encode(ba);
                        ir = ASCIIUtility.toString(ba2, 0, ba2.length);
                    } else {
                        ir = "=";
                    }
                }
                if (ir != null) {
                    resp = this.pr.simpleCommand("AUTH " + mech + " " + ir);
                } else {
                    resp = this.pr.simpleCommand("AUTH " + mech);
                }
                if (resp == 530) {
                    this.pr.startTLS();
                    if (ir != null) {
                        resp = this.pr.simpleCommand("AUTH " + mech + " " + ir);
                    } else {
                        resp = this.pr.simpleCommand("AUTH " + mech);
                    }
                }
                if (resp == 235) {
                    return true;
                }
                if (resp != 334) {
                    return false;
                }
                while (!done) {
                    if (resp == 334) {
                        try {
                            byte[] ba3 = null;
                            if (!sc.isComplete()) {
                                byte[] ba4 = ASCIIUtility.getBytes(responseText(this.pr));
                                if (ba4.length > 0) {
                                    ba4 = BASE64DecoderStream.decode(ba4);
                                }
                                if (this.logger.isLoggable(Level.FINE)) {
                                    this.logger.fine("SASL challenge: " + ASCIIUtility.toString(ba4, 0, ba4.length) + " :");
                                }
                                ba3 = sc.evaluateChallenge(ba4);
                            }
                            if (ba3 == null) {
                                this.logger.fine("SASL: no response");
                                resp = this.pr.simpleCommand("*");
                            } else {
                                if (this.logger.isLoggable(Level.FINE)) {
                                    this.logger.fine("SASL response: " + ASCIIUtility.toString(ba3, 0, ba3.length) + " :");
                                }
                                resp = this.pr.simpleCommand(BASE64EncoderStream.encode(ba3));
                            }
                        } catch (Exception ioex) {
                            this.logger.log(Level.FINE, "SASL Exception", (Throwable) ioex);
                            done = true;
                        }
                    } else {
                        done = true;
                    }
                }
                if (resp != 235) {
                    return false;
                }
                if (sc.isComplete() && (qop = (String) sc.getNegotiatedProperty("javax.security.sasl.qop")) != null) {
                    if (qop.equalsIgnoreCase("auth-int") || qop.equalsIgnoreCase("auth-conf")) {
                        this.logger.fine("SASL Mechanism requires integrity or confidentiality");
                        return false;
                    }
                    return true;
                }
                return true;
            } catch (Exception ex) {
                this.logger.log(Level.FINE, "SASL AUTHENTICATE Exception", (Throwable) ex);
                return false;
            }
        } catch (SaslException e) {
            this.logger.log(Level.FINE, "Failed to create SASL client", e);
            throw new UnsupportedOperationException(e.getMessage(), e);
        }
    }

    private static final String responseText(SMTPTransport pr) {
        String resp = pr.getLastServerResponse().trim();
        if (resp.length() > 4) {
            return resp.substring(4);
        }
        return "";
    }
}
