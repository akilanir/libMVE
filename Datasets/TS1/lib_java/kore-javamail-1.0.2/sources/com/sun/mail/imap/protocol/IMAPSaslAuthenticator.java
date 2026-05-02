package com.sun.mail.imap.protocol;

import com.sun.mail.auth.OAuth2SaslClientFactory;
import com.sun.mail.iap.Argument;
import com.sun.mail.iap.ProtocolException;
import com.sun.mail.iap.Response;
import com.sun.mail.util.ASCIIUtility;
import com.sun.mail.util.BASE64DecoderStream;
import com.sun.mail.util.BASE64EncoderStream;
import com.sun.mail.util.MailLogger;
import com.sun.mail.util.PropUtil;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
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

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/protocol/IMAPSaslAuthenticator.class */
public class IMAPSaslAuthenticator implements SaslAuthenticator {
    private IMAPProtocol pr;
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

    public IMAPSaslAuthenticator(IMAPProtocol pr, String name, Properties props, MailLogger logger, String host) {
        this.pr = pr;
        this.name = name;
        this.props = props;
        this.logger = logger;
        this.host = host;
    }

    @Override // com.sun.mail.imap.protocol.SaslAuthenticator
    public boolean authenticate(String[] mechs, final String realm, String authzid, final String u, final String p) throws ProtocolException {
        String qop;
        String irs;
        synchronized (this.pr) {
            List<Response> v = new ArrayList<>();
            Response r = null;
            boolean done = false;
            if (this.logger.isLoggable(Level.FINE)) {
                this.logger.fine("SASL Mechanisms:");
                for (String str : mechs) {
                    this.logger.fine(" " + str);
                }
                this.logger.fine("");
            }
            CallbackHandler cbh = new CallbackHandler() { // from class: com.sun.mail.imap.protocol.IMAPSaslAuthenticator.1
                @Override // javax.security.auth.callback.CallbackHandler
                public void handle(Callback[] callbacks) {
                    if (IMAPSaslAuthenticator.this.logger.isLoggable(Level.FINE)) {
                        IMAPSaslAuthenticator.this.logger.fine("SASL callback length: " + callbacks.length);
                    }
                    for (int i = 0; i < callbacks.length; i++) {
                        if (IMAPSaslAuthenticator.this.logger.isLoggable(Level.FINE)) {
                            IMAPSaslAuthenticator.this.logger.fine("SASL callback " + i + ": " + callbacks[i]);
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
                    Argument args = new Argument();
                    args.writeAtom(sc.getMechanismName());
                    if (this.pr.hasCapability("SASL-IR") && sc.hasInitialResponse()) {
                        byte[] ba = sc.evaluateChallenge(new byte[0]);
                        if (ba.length > 0) {
                            byte[] ba2 = BASE64EncoderStream.encode(ba);
                            irs = ASCIIUtility.toString(ba2, 0, ba2.length);
                        } else {
                            irs = "=";
                        }
                        args.writeAtom(irs);
                    }
                    String tag = this.pr.writeCommand("AUTHENTICATE", args);
                    OutputStream os = this.pr.getIMAPOutputStream();
                    ByteArrayOutputStream bos = new ByteArrayOutputStream();
                    byte[] CRLF = {13, 10};
                    boolean isXGWTRUSTEDAPP = sc.getMechanismName().equals("XGWTRUSTEDAPP") && PropUtil.getBooleanProperty(this.props, new StringBuilder().append("mail.").append(this.name).append(".sasl.xgwtrustedapphack.enable").toString(), true);
                    while (!done) {
                        try {
                            r = this.pr.readResponse();
                            if (r.isContinuation()) {
                                byte[] ba3 = null;
                                if (!sc.isComplete()) {
                                    byte[] ba4 = r.readByteArray().getNewBytes();
                                    if (ba4.length > 0) {
                                        ba4 = BASE64DecoderStream.decode(ba4);
                                    }
                                    if (this.logger.isLoggable(Level.FINE)) {
                                        this.logger.fine("SASL challenge: " + ASCIIUtility.toString(ba4, 0, ba4.length) + " :");
                                    }
                                    ba3 = sc.evaluateChallenge(ba4);
                                }
                                if (ba3 == null) {
                                    this.logger.fine("SASL no response");
                                    os.write(CRLF);
                                    os.flush();
                                    bos.reset();
                                } else {
                                    if (this.logger.isLoggable(Level.FINE)) {
                                        this.logger.fine("SASL response: " + ASCIIUtility.toString(ba3, 0, ba3.length) + " :");
                                    }
                                    byte[] ba5 = BASE64EncoderStream.encode(ba3);
                                    if (isXGWTRUSTEDAPP) {
                                        bos.write(ASCIIUtility.getBytes("XGWTRUSTEDAPP "));
                                    }
                                    bos.write(ba5);
                                    bos.write(CRLF);
                                    os.write(bos.toByteArray());
                                    os.flush();
                                    bos.reset();
                                }
                            } else if ((r.isTagged() && r.getTag().equals(tag)) || r.isBYE()) {
                                done = true;
                            } else {
                                v.add(r);
                            }
                        } catch (Exception ioex) {
                            this.logger.log(Level.FINE, "SASL Exception", (Throwable) ioex);
                            r = Response.byeResponse(ioex);
                            done = true;
                        }
                    }
                    if (sc.isComplete() && (qop = (String) sc.getNegotiatedProperty("javax.security.sasl.qop")) != null && (qop.equalsIgnoreCase("auth-int") || qop.equalsIgnoreCase("auth-conf"))) {
                        this.logger.fine("SASL Mechanism requires integrity or confidentiality");
                        return false;
                    }
                    this.pr.notifyResponseHandlers((Response[]) v.toArray(new Response[v.size()]));
                    this.pr.handleResult(r);
                    this.pr.setCapabilities(r);
                    if (isXGWTRUSTEDAPP && authzid != null) {
                        Argument args2 = new Argument();
                        args2.writeString(authzid);
                        Response[] responses = this.pr.command("LOGIN", args2);
                        this.pr.notifyResponseHandlers(responses);
                        this.pr.handleResult(responses[responses.length - 1]);
                        this.pr.setCapabilities(responses[responses.length - 1]);
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
    }
}
