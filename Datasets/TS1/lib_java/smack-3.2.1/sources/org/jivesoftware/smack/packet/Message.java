package org.jivesoftware.smack.packet;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.jivesoftware.smack.util.StringUtils;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/Message.class */
public class Message extends Packet {
    private Type type;
    private String thread;
    private String language;
    private final Set<Subject> subjects;
    private final Set<Body> bodies;

    public Message() {
        this.type = Type.normal;
        this.thread = null;
        this.subjects = new HashSet();
        this.bodies = new HashSet();
    }

    public Message(String to) {
        this.type = Type.normal;
        this.thread = null;
        this.subjects = new HashSet();
        this.bodies = new HashSet();
        setTo(to);
    }

    public Message(String to, Type type) {
        this.type = Type.normal;
        this.thread = null;
        this.subjects = new HashSet();
        this.bodies = new HashSet();
        setTo(to);
        this.type = type;
    }

    public Type getType() {
        return this.type;
    }

    public void setType(Type type) {
        if (type == null) {
            throw new IllegalArgumentException("Type cannot be null.");
        }
        this.type = type;
    }

    public String getSubject() {
        return getSubject(null);
    }

    public String getSubject(String language) {
        Subject subject = getMessageSubject(language);
        if (subject == null) {
            return null;
        }
        return subject.subject;
    }

    private Subject getMessageSubject(String language) {
        String language2 = determineLanguage(language);
        for (Subject subject : this.subjects) {
            if (language2.equals(subject.language)) {
                return subject;
            }
        }
        return null;
    }

    public Collection<Subject> getSubjects() {
        return Collections.unmodifiableCollection(this.subjects);
    }

    public void setSubject(String subject) {
        if (subject == null) {
            removeSubject(XmlPullParser.NO_NAMESPACE);
        } else {
            addSubject(null, subject);
        }
    }

    public Subject addSubject(String language, String subject) {
        Subject messageSubject = new Subject(determineLanguage(language), subject);
        this.subjects.add(messageSubject);
        return messageSubject;
    }

    public boolean removeSubject(String language) {
        String language2 = determineLanguage(language);
        for (Subject subject : this.subjects) {
            if (language2.equals(subject.language)) {
                return this.subjects.remove(subject);
            }
        }
        return false;
    }

    public boolean removeSubject(Subject subject) {
        return this.subjects.remove(subject);
    }

    public Collection<String> getSubjectLanguages() {
        Subject defaultSubject = getMessageSubject(null);
        List<String> languages = new ArrayList<>();
        for (Subject subject : this.subjects) {
            if (!subject.equals(defaultSubject)) {
                languages.add(subject.language);
            }
        }
        return Collections.unmodifiableCollection(languages);
    }

    public String getBody() {
        return getBody(null);
    }

    public String getBody(String language) {
        Body body = getMessageBody(language);
        if (body == null) {
            return null;
        }
        return body.message;
    }

    private Body getMessageBody(String language) {
        String language2 = determineLanguage(language);
        for (Body body : this.bodies) {
            if (language2.equals(body.language)) {
                return body;
            }
        }
        return null;
    }

    public Collection<Body> getBodies() {
        return Collections.unmodifiableCollection(this.bodies);
    }

    public void setBody(String body) {
        if (body == null) {
            removeBody(XmlPullParser.NO_NAMESPACE);
        } else {
            addBody(null, body);
        }
    }

    public Body addBody(String language, String body) {
        Body messageBody = new Body(determineLanguage(language), body);
        this.bodies.add(messageBody);
        return messageBody;
    }

    public boolean removeBody(String language) {
        String language2 = determineLanguage(language);
        for (Body body : this.bodies) {
            if (language2.equals(body.language)) {
                return this.bodies.remove(body);
            }
        }
        return false;
    }

    public boolean removeBody(Body body) {
        return this.bodies.remove(body);
    }

    public Collection<String> getBodyLanguages() {
        Body defaultBody = getMessageBody(null);
        List<String> languages = new ArrayList<>();
        for (Body body : this.bodies) {
            if (!body.equals(defaultBody)) {
                languages.add(body.language);
            }
        }
        return Collections.unmodifiableCollection(languages);
    }

    public String getThread() {
        return this.thread;
    }

    public void setThread(String thread) {
        this.thread = thread;
    }

    public String getLanguage() {
        return this.language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    private String determineLanguage(String language) {
        String language2 = XmlPullParser.NO_NAMESPACE.equals(language) ? null : language;
        if (language2 == null && this.language != null) {
            return this.language;
        }
        if (language2 == null) {
            return getDefaultLanguage();
        }
        return language2;
    }

    @Override // org.jivesoftware.smack.packet.Packet
    public String toXML() {
        XMPPError error;
        StringBuilder buf = new StringBuilder();
        buf.append("<message");
        if (getXmlns() != null) {
            buf.append(" xmlns=\"").append(getXmlns()).append("\"");
        }
        if (this.language != null) {
            buf.append(" xml:lang=\"").append(getLanguage()).append("\"");
        }
        if (getPacketID() != null) {
            buf.append(" id=\"").append(getPacketID()).append("\"");
        }
        if (getTo() != null) {
            buf.append(" to=\"").append(StringUtils.escapeForXML(getTo())).append("\"");
        }
        if (getFrom() != null) {
            buf.append(" from=\"").append(StringUtils.escapeForXML(getFrom())).append("\"");
        }
        if (this.type != Type.normal) {
            buf.append(" type=\"").append(this.type).append("\"");
        }
        buf.append(">");
        Subject defaultSubject = getMessageSubject(null);
        if (defaultSubject != null) {
            buf.append("<subject>").append(StringUtils.escapeForXML(defaultSubject.subject)).append("</subject>");
        }
        for (Subject subject : getSubjects()) {
            if (!subject.equals(defaultSubject)) {
                buf.append("<subject xml:lang=\"").append(subject.language).append("\">");
                buf.append(StringUtils.escapeForXML(subject.subject));
                buf.append("</subject>");
            }
        }
        Body defaultBody = getMessageBody(null);
        if (defaultBody != null) {
            buf.append("<body>").append(StringUtils.escapeForXML(defaultBody.message)).append("</body>");
        }
        for (Body body : getBodies()) {
            if (!body.equals(defaultBody)) {
                buf.append("<body xml:lang=\"").append(body.getLanguage()).append("\">");
                buf.append(StringUtils.escapeForXML(body.getMessage()));
                buf.append("</body>");
            }
        }
        if (this.thread != null) {
            buf.append("<thread>").append(this.thread).append("</thread>");
        }
        if (this.type == Type.error && (error = getError()) != null) {
            buf.append(error.toXML());
        }
        buf.append(getExtensionsXML());
        buf.append("</message>");
        return buf.toString();
    }

    @Override // org.jivesoftware.smack.packet.Packet
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Message message = (Message) o;
        if (!super.equals(message) || this.bodies.size() != message.bodies.size() || !this.bodies.containsAll(message.bodies)) {
            return false;
        }
        if (this.language != null) {
            if (!this.language.equals(message.language)) {
                return false;
            }
        } else if (message.language != null) {
            return false;
        }
        if (this.subjects.size() != message.subjects.size() || !this.subjects.containsAll(message.subjects)) {
            return false;
        }
        if (this.thread != null) {
            if (!this.thread.equals(message.thread)) {
                return false;
            }
        } else if (message.thread != null) {
            return false;
        }
        return this.type == message.type;
    }

    @Override // org.jivesoftware.smack.packet.Packet
    public int hashCode() {
        int result = this.type != null ? this.type.hashCode() : 0;
        return (31 * ((31 * ((31 * ((31 * result) + this.subjects.hashCode())) + (this.thread != null ? this.thread.hashCode() : 0))) + (this.language != null ? this.language.hashCode() : 0))) + this.bodies.hashCode();
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/Message$Subject.class */
    public static class Subject {
        private String subject;
        private String language;

        private Subject(String language, String subject) {
            if (language == null) {
                throw new NullPointerException("Language cannot be null.");
            }
            if (subject == null) {
                throw new NullPointerException("Subject cannot be null.");
            }
            this.language = language;
            this.subject = subject;
        }

        public String getLanguage() {
            return this.language;
        }

        public String getSubject() {
            return this.subject;
        }

        public int hashCode() {
            int result = (31 * 1) + this.language.hashCode();
            return (31 * result) + this.subject.hashCode();
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            Subject other = (Subject) obj;
            return this.language.equals(other.language) && this.subject.equals(other.subject);
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/Message$Body.class */
    public static class Body {
        private String message;
        private String language;

        private Body(String language, String message) {
            if (language == null) {
                throw new NullPointerException("Language cannot be null.");
            }
            if (message == null) {
                throw new NullPointerException("Message cannot be null.");
            }
            this.language = language;
            this.message = message;
        }

        public String getLanguage() {
            return this.language;
        }

        public String getMessage() {
            return this.message;
        }

        public int hashCode() {
            int result = (31 * 1) + this.language.hashCode();
            return (31 * result) + this.message.hashCode();
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            Body other = (Body) obj;
            return this.language.equals(other.language) && this.message.equals(other.message);
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/Message$Type.class */
    public enum Type {
        normal,
        chat,
        groupchat,
        headline,
        error;

        public static Type fromString(String name) {
            try {
                return valueOf(name);
            } catch (Exception e) {
                return normal;
            }
        }
    }
}
