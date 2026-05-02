.class public Lorg/apache/commons/validator/EmailValidator;
.super Ljava/lang/Object;
.source "EmailValidator.java"


# static fields
.field private static final ATOM:Ljava/lang/String; = "[^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]+"

.field private static final ATOM_PATTERN:Ljava/util/regex/Pattern;

.field private static final DOMAIN_PATTERN:Ljava/util/regex/Pattern;

.field private static final EMAIL_PATTERN:Ljava/util/regex/Pattern;

.field private static final EMAIL_VALIDATOR:Lorg/apache/commons/validator/EmailValidator;

.field private static final IP_DOMAIN_PATTERN:Ljava/util/regex/Pattern;

.field private static final LEGAL_ASCII_PATTERN:Ljava/util/regex/Pattern;

.field private static final QUOTED_USER:Ljava/lang/String; = "(\"[^\"]*\")"

.field private static final SPECIAL_CHARS:Ljava/lang/String; = "\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]"

.field private static final TLD_PATTERN:Ljava/util/regex/Pattern;

.field private static final USER_PATTERN:Ljava/util/regex/Pattern;

.field private static final VALID_CHARS:Ljava/lang/String; = "[^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]"

.field private static final WORD:Ljava/lang/String; = "(([^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]|\')+|(\"[^\"]*\"))"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 52
    const-string v0, "^\\p{ASCII}+$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/EmailValidator;->LEGAL_ASCII_PATTERN:Ljava/util/regex/Pattern;

    .line 53
    const-string v0, "^(.+)@(.+)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/EmailValidator;->EMAIL_PATTERN:Ljava/util/regex/Pattern;

    .line 54
    const-string v0, "^\\[(.*)\\]$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/EmailValidator;->IP_DOMAIN_PATTERN:Ljava/util/regex/Pattern;

    .line 55
    const-string v0, "^([a-zA-Z]+)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/EmailValidator;->TLD_PATTERN:Ljava/util/regex/Pattern;

    .line 57
    const-string v0, "^\\s*(([^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]|\')+|(\"[^\"]*\"))(\\.(([^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]|\')+|(\"[^\"]*\")))*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/EmailValidator;->USER_PATTERN:Ljava/util/regex/Pattern;

    .line 58
    const-string v0, "^[^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]+(\\.[^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]+)*\\s*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/EmailValidator;->DOMAIN_PATTERN:Ljava/util/regex/Pattern;

    .line 59
    const-string v0, "([^\\s\\p{Cntrl}\\(\\)<>@,;:\'\\\\\\\"\\.\\[\\]]+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/EmailValidator;->ATOM_PATTERN:Ljava/util/regex/Pattern;

    .line 64
    new-instance v0, Lorg/apache/commons/validator/EmailValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/EmailValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/EmailValidator;->EMAIL_VALIDATOR:Lorg/apache/commons/validator/EmailValidator;

    return-void
.end method

.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/validator/EmailValidator;
    .registers 1

    .prologue
    .line 71
    sget-object v0, Lorg/apache/commons/validator/EmailValidator;->EMAIL_VALIDATOR:Lorg/apache/commons/validator/EmailValidator;

    return-object v0
.end method


# virtual methods
.method public isValid(Ljava/lang/String;)Z
    .registers 3
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-static {}, Lorg/apache/commons/validator/routines/EmailValidator;->getInstance()Lorg/apache/commons/validator/routines/EmailValidator;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/validator/routines/EmailValidator;->isValid(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected isValidDomain(Ljava/lang/String;)Z
    .registers 8
    .param p1, "domain"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 98
    const/4 v2, 0x0

    .line 101
    .local v2, "symbolic":Z
    sget-object v5, Lorg/apache/commons/validator/EmailValidator;->IP_DOMAIN_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v5, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 103
    .local v1, "ipDomainMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    if-eqz v5, :cond_1e

    .line 104
    invoke-static {}, Lorg/apache/commons/validator/routines/InetAddressValidator;->getInstance()Lorg/apache/commons/validator/routines/InetAddressValidator;

    move-result-object v0

    .line 106
    .local v0, "inetAddressValidator":Lorg/apache/commons/validator/routines/InetAddressValidator;
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lorg/apache/commons/validator/routines/InetAddressValidator;->isValid(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_28

    .line 122
    .end local v0    # "inetAddressValidator":Lorg/apache/commons/validator/routines/InetAddressValidator;
    :cond_1d
    :goto_1d
    return v3

    .line 111
    :cond_1e
    sget-object v5, Lorg/apache/commons/validator/EmailValidator;->DOMAIN_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v5, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    .line 114
    :cond_28
    if-eqz v2, :cond_32

    .line 115
    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/EmailValidator;->isValidSymbolicDomain(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1d

    move v3, v4

    .line 116
    goto :goto_1d

    :cond_32
    move v3, v4

    .line 119
    goto :goto_1d
.end method

.method protected isValidIpAddress(Ljava/lang/String;)Z
    .registers 9
    .param p1, "ipAddress"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 140
    sget-object v6, Lorg/apache/commons/validator/EmailValidator;->IP_DOMAIN_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v6, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 141
    .local v3, "ipAddressMatcher":Ljava/util/regex/Matcher;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_8
    const/4 v6, 0x4

    if-gt v1, v6, :cond_26

    .line 142
    invoke-virtual {v3, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    .line 143
    .local v4, "ipSegment":Ljava/lang/String;
    if-eqz v4, :cond_17

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-gtz v6, :cond_18

    .line 160
    .end local v4    # "ipSegment":Ljava/lang/String;
    :cond_17
    :goto_17
    return v5

    .line 147
    .restart local v4    # "ipSegment":Ljava/lang/String;
    :cond_18
    const/4 v2, 0x0

    .line 150
    .local v2, "iIpSegment":I
    :try_start_19
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1c
    .catch Ljava/lang/NumberFormatException; {:try_start_19 .. :try_end_1c} :catch_24

    move-result v2

    .line 155
    const/16 v6, 0xff

    if-gt v2, v6, :cond_17

    .line 141
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 151
    :catch_24
    move-exception v0

    .line 152
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_17

    .line 160
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "iIpSegment":I
    .end local v4    # "ipSegment":Ljava/lang/String;
    :cond_26
    const/4 v5, 0x1

    goto :goto_17
.end method

.method protected isValidSymbolicDomain(Ljava/lang/String;)Z
    .registers 12
    .param p1, "domain"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 169
    const/16 v9, 0xa

    new-array v1, v9, [Ljava/lang/String;

    .line 170
    .local v1, "domainSegment":[Ljava/lang/String;
    const/4 v5, 0x1

    .line 171
    .local v5, "match":Z
    const/4 v2, 0x0

    .line 172
    .local v2, "i":I
    sget-object v9, Lorg/apache/commons/validator/EmailValidator;->ATOM_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v9, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 173
    .local v0, "atomMatcher":Ljava/util/regex/Matcher;
    :cond_e
    :goto_e
    if-eqz v5, :cond_34

    .line 174
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    .line 175
    if-eqz v5, :cond_e

    .line 176
    invoke-virtual {v0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v1, v2

    .line 177
    aget-object v9, v1, v2

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v3, v9, 0x1

    .line 178
    .local v3, "l":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v9

    if-lt v3, v9, :cond_2f

    const-string p1, ""

    .line 183
    :goto_2c
    add-int/lit8 v2, v2, 0x1

    .line 184
    goto :goto_e

    .line 178
    :cond_2f
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_2c

    .line 187
    .end local v3    # "l":I
    :cond_34
    move v4, v2

    .line 190
    .local v4, "len":I
    const/4 v9, 0x2

    if-ge v4, v9, :cond_39

    .line 205
    :cond_38
    :goto_38
    return v7

    .line 196
    :cond_39
    add-int/lit8 v9, v4, -0x1

    aget-object v6, v1, v9

    .line 197
    .local v6, "tld":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v9

    if-le v9, v8, :cond_38

    .line 198
    sget-object v9, Lorg/apache/commons/validator/EmailValidator;->TLD_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v9, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/regex/Matcher;->matches()Z

    move-result v9

    if-eqz v9, :cond_38

    move v7, v8

    .line 205
    goto :goto_38
.end method

.method protected isValidUser(Ljava/lang/String;)Z
    .registers 3
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 131
    sget-object v0, Lorg/apache/commons/validator/EmailValidator;->USER_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    return v0
.end method

.method protected stripComments(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "emailStr"    # Ljava/lang/String;

    .prologue
    .line 216
    move-object v2, p1

    .line 217
    .local v2, "result":Ljava/lang/String;
    const-string v1, "^((?:[^\"\\\\]|\\\\.)*(?:\"(?:[^\"\\\\]|\\\\.)*\"(?:[^\"\\\\]|I111\\\\.)*)*)\\((?:[^()\\\\]|\\\\.)*\\)/"

    .line 218
    .local v1, "commentPat":Ljava/lang/String;
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 220
    .local v0, "commentMatcher":Ljava/util/regex/Pattern;
    :goto_7
    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_18

    .line 221
    const-string v3, "\u0001 "

    invoke-virtual {v2, v1, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_7

    .line 223
    :cond_18
    return-object v2
.end method
