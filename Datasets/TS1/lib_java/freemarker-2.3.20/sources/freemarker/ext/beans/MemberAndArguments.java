package freemarker.ext.beans;

import java.lang.reflect.Member;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/MemberAndArguments.class */
class MemberAndArguments {
    private final Member member;
    private final Object[] args;

    MemberAndArguments(Member member, Object[] args) {
        this.member = member;
        this.args = args;
    }

    Object[] getArgs() {
        return this.args;
    }

    public Member getMember() {
        return this.member;
    }
}
