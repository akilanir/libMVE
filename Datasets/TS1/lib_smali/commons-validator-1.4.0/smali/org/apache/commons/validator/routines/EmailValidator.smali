.class public Lorg/apache/commons/validator/routines/EmailValidator;
.super Ljava/lang/Object;
.source "EmailValidator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final EMAIL_PATTERN:Ljava/util/regex/Pattern;

.field private static final EMAIL_REGEX:Ljava/lang/String; = "^\\s*?(.+)@(.+?)\\s*$"

.field private static final EMAIL_VALIDATOR:Lorg/apache/commons/validator/routines/EmailValidator;

.field private static final EMAIL_VALIDATOR_WITH_LOCAL:Lorg/apache/commons/validator/routines/EmailValidator;

.field private static final IP_DOMAIN_PATTERN:Ljava/util/regex/Pattern;

.field private static final IP_DOMAIN_REGEX:Ljava/lang/String; = "^\\[(.*)\\]$"

.field private static final LEGAL_ASCII_REGEX:Ljava/lang/String; = "^\\p{ASCII}+$"

.field private static final MATCH_ASCII_PATTERN:Ljava/util/regex/Pattern;

.field private static final QUOTED_USER:Ljava/lang/String; = "(\"[^\"]*\")"

.field private static final SPECIAL_CHARS:Ljava/lang/String; = "\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]"

.field private static final USER_PATTERN:Ljava/util/regex/Pattern;

.field private static final USER_REGEX:Ljava/lang/String; = "^\\s*(([^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]|\')+|(\"[^\"]*\"))(\\.(([^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]|\')+|(\"[^\"]*\")))*$"

.field private static final VALID_CHARS:Ljava/lang/String; = "[^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]"

.field private static final WORD:Ljava/lang/String; = "(([^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]|\')+|(\"[^\"]*\"))"

.field private static final serialVersionUID:J = 0x17acab9aef934988L


# instance fields
.field private final allowLocal:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 55
    const-string v0, "^\\p{ASCII}+$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/EmailValidator;->MATCH_ASCII_PATTERN:Ljava/util/regex/Pattern;

    .line 56
    const-string v0, "^\\s*?(.+)@(.+?)\\s*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/EmailValidator;->EMAIL_PATTERN:Ljava/util/regex/Pattern;

    .line 57
    const-string v0, "^\\[(.*)\\]$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/EmailValidator;->IP_DOMAIN_PATTERN:Ljava/util/regex/Pattern;

    .line 58
    const-string v0, "^\\s*(([^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]|\')+|(\"[^\"]*\"))(\\.(([^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]|\')+|(\"[^\"]*\")))*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/EmailValidator;->USER_PATTERN:Ljava/util/regex/Pattern;

    .line 66
    new-instance v0, Lorg/apache/commons/validator/routines/EmailValidator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/commons/validator/routines/EmailValidator;-><init>(Z)V

    sput-object v0, Lorg/apache/commons/validator/routines/EmailValidator;->EMAIL_VALIDATOR:Lorg/apache/commons/validator/routines/EmailValidator;

    .line 72
    new-instance v0, Lorg/apache/commons/validator/routines/EmailValidator;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/apache/commons/validator/routines/EmailValidator;-><init>(Z)V

    sput-object v0, Lorg/apache/commons/validator/routines/EmailValidator;->EMAIL_VALIDATOR_WITH_LOCAL:Lorg/apache/commons/validator/routines/EmailValidator;

    return-void
.end method

.method protected constructor <init>(Z)V
    .registers 2
    .param p1, "allowLocal"    # Z

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput-boolean p1, p0, Lorg/apache/commons/validator/routines/EmailValidator;->allowLocal:Z

    .line 105
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/EmailValidator;
    .registers 1

    .prologue
    .line 80
    sget-object v0, Lorg/apache/commons/validator/routines/EmailValidator;->EMAIL_VALIDATOR:Lorg/apache/commons/validator/routines/EmailValidator;

    return-object v0
.end method

.method public static getInstance(Z)Lorg/apache/commons/validator/routines/EmailValidator;
    .registers 2
    .param p0, "allowLocal"    # Z

    .prologue
    .line 91
    if-eqz p0, :cond_5

    .line 92
    sget-object v0, Lorg/apache/commons/validator/routines/EmailValidator;->EMAIL_VALIDATOR_WITH_LOCAL:Lorg/apache/commons/validator/routines/EmailValidator;

    .line 94
    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Lorg/apache/commons/validator/routines/EmailValidator;->EMAIL_VALIDATOR:Lorg/apache/commons/validator/routines/EmailValidator;

    goto :goto_4
.end method


# virtual methods
.method public isValid(Ljava/lang/String;)Z
    .registers 7
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 115
    if-nez p1, :cond_5

    .line 142
    :cond_4
    :goto_4
    return v2

    .line 119
    :cond_5
    sget-object v4, Lorg/apache/commons/validator/routines/EmailValidator;->MATCH_ASCII_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v4, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 120
    .local v0, "asciiMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 125
    sget-object v4, Lorg/apache/commons/validator/routines/EmailValidator;->EMAIL_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v4, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 126
    .local v1, "emailMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 130
    const-string v4, "."

    invoke-virtual {p1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 134
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/validator/routines/EmailValidator;->isValidUser(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 138
    const/4 v4, 0x2

    invoke-virtual {v1, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/validator/routines/EmailValidator;->isValidDomain(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    move v2, v3

    .line 142
    goto :goto_4
.end method

.method protected isValidDomain(Ljava/lang/String;)Z
    .registers 6
    .param p1, "domain"    # Ljava/lang/String;

    .prologue
    .line 153
    sget-object v3, Lorg/apache/commons/validator/routines/EmailValidator;->IP_DOMAIN_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 155
    .local v2, "ipDomainMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 156
    invoke-static {}, Lorg/apache/commons/validator/routines/InetAddressValidator;->getInstance()Lorg/apache/commons/validator/routines/InetAddressValidator;

    move-result-object v1

    .line 158
    .local v1, "inetAddressValidator":Lorg/apache/commons/validator/routines/InetAddressValidator;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/commons/validator/routines/InetAddressValidator;->isValid(Ljava/lang/String;)Z

    move-result v3

    .line 163
    .end local v1    # "inetAddressValidator":Lorg/apache/commons/validator/routines/InetAddressValidator;
    :goto_19
    return v3

    .line 161
    :cond_1a
    iget-boolean v3, p0, Lorg/apache/commons/validator/routines/EmailValidator;->allowLocal:Z

    invoke-static {v3}, Lorg/apache/commons/validator/routines/DomainValidator;->getInstance(Z)Lorg/apache/commons/validator/routines/DomainValidator;

    move-result-object v0

    .line 163
    .local v0, "domainValidator":Lorg/apache/commons/validator/routines/DomainValidator;
    invoke-virtual {v0, p1}, Lorg/apache/commons/validator/routines/DomainValidator;->isValid(Ljava/lang/String;)Z

    move-result v3

    goto :goto_19
.end method

.method protected isValidUser(Ljava/lang/String;)Z
    .registers 3
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 174
    sget-object v0, Lorg/apache/commons/validator/routines/EmailValidator;->USER_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    return v0
.end method
