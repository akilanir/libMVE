package ezvcard.io.scribe;

import ezvcard.property.Member;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/MemberScribe.class */
public class MemberScribe extends StringPropertyScribe<Member> {
    public MemberScribe() {
        super(Member.class, "MEMBER");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Member _parseValue(String value) {
        return new Member(value);
    }
}
