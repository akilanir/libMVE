.class public abstract Lkorex/mail/search/AddressStringTerm;
.super Lkorex/mail/search/StringTerm;
.source "AddressStringTerm.java"


# static fields
.field private static final serialVersionUID:J = 0x2ad6978ecdebb490L


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 69
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lkorex/mail/search/StringTerm;-><init>(Ljava/lang/String;Z)V

    .line 70
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 100
    instance-of v0, p1, Lkorex/mail/search/AddressStringTerm;

    if-nez v0, :cond_6

    .line 101
    const/4 v0, 0x0

    .line 102
    :goto_5
    return v0

    :cond_6
    invoke-super {p0, p1}, Lkorex/mail/search/StringTerm;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method protected match(Lkorex/mail/Address;)Z
    .registers 4
    .param p1, "a"    # Lkorex/mail/Address;

    .prologue
    .line 85
    instance-of v1, p1, Lkorex/mail/internet/InternetAddress;

    if-eqz v1, :cond_10

    move-object v0, p1

    .line 86
    check-cast v0, Lkorex/mail/internet/InternetAddress;

    .line 91
    .local v0, "ia":Lkorex/mail/internet/InternetAddress;
    invoke-virtual {v0}, Lkorex/mail/internet/InternetAddress;->toUnicodeString()Ljava/lang/String;

    move-result-object v1

    invoke-super {p0, v1}, Lkorex/mail/search/StringTerm;->match(Ljava/lang/String;)Z

    move-result v1

    .line 93
    .end local v0    # "ia":Lkorex/mail/internet/InternetAddress;
    :goto_f
    return v1

    :cond_10
    invoke-virtual {p1}, Lkorex/mail/Address;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-super {p0, v1}, Lkorex/mail/search/StringTerm;->match(Ljava/lang/String;)Z

    move-result v1

    goto :goto_f
.end method
