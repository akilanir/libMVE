.class public Lorg/apache/commons/validator/routines/UrlValidator;
.super Ljava/lang/Object;
.source "UrlValidator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final ALLOW_2_SLASHES:J = 0x2L

.field public static final ALLOW_ALL_SCHEMES:J = 0x1L

.field public static final ALLOW_LOCAL_URLS:J = 0x8L

.field private static final ASCII_PATTERN:Ljava/util/regex/Pattern;

.field private static final AUTHORITY_CHARS_REGEX:Ljava/lang/String; = "\\p{Alnum}\\-\\."

.field private static final AUTHORITY_PATTERN:Ljava/util/regex/Pattern;

.field private static final AUTHORITY_REGEX:Ljava/lang/String; = "^([\\p{Alnum}\\-\\.]*)(:\\d*)?(.*)?"

.field private static final DEFAULT_SCHEMES:[Ljava/lang/String;

.field private static final DEFAULT_URL_VALIDATOR:Lorg/apache/commons/validator/routines/UrlValidator;

.field private static final LEGAL_ASCII_REGEX:Ljava/lang/String; = "^\\p{ASCII}+$"

.field public static final NO_FRAGMENTS:J = 0x4L

.field private static final PARSE_AUTHORITY_EXTRA:I = 0x3

.field private static final PARSE_AUTHORITY_HOST_IP:I = 0x1

.field private static final PARSE_AUTHORITY_PORT:I = 0x2

.field private static final PARSE_URL_AUTHORITY:I = 0x4

.field private static final PARSE_URL_FRAGMENT:I = 0x9

.field private static final PARSE_URL_PATH:I = 0x5

.field private static final PARSE_URL_QUERY:I = 0x7

.field private static final PARSE_URL_SCHEME:I = 0x2

.field private static final PATH_PATTERN:Ljava/util/regex/Pattern;

.field private static final PATH_REGEX:Ljava/lang/String; = "^(/[-\\w:@&?=+,.!/~*\'%$_;\\(\\)]*)?$"

.field private static final PORT_PATTERN:Ljava/util/regex/Pattern;

.field private static final PORT_REGEX:Ljava/lang/String; = "^:(\\d{1,5})$"

.field private static final QUERY_PATTERN:Ljava/util/regex/Pattern;

.field private static final QUERY_REGEX:Ljava/lang/String; = "^(.*)$"

.field private static final SCHEME_PATTERN:Ljava/util/regex/Pattern;

.field private static final SCHEME_REGEX:Ljava/lang/String; = "^\\p{Alpha}[\\p{Alnum}\\+\\-\\.]*"

.field private static final URL_PATTERN:Ljava/util/regex/Pattern;

.field private static final URL_REGEX:Ljava/lang/String; = "^(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\\?([^#]*))?(#(.*))?"

.field private static final serialVersionUID:J = 0x68e06e8a0d6ac2e5L


# instance fields
.field private final allowedSchemes:Ljava/util/Set;

.field private final authorityValidator:Lorg/apache/commons/validator/routines/RegexValidator;

.field private final options:J


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 110
    const-string v0, "^(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\\?([^#]*))?(#(.*))?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/UrlValidator;->URL_PATTERN:Ljava/util/regex/Pattern;

    .line 132
    const-string v0, "^\\p{Alpha}[\\p{Alnum}\\+\\-\\.]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/UrlValidator;->SCHEME_PATTERN:Ljava/util/regex/Pattern;

    .line 137
    const-string v0, "^([\\p{Alnum}\\-\\.]*)(:\\d*)?(.*)?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/UrlValidator;->AUTHORITY_PATTERN:Ljava/util/regex/Pattern;

    .line 149
    const-string v0, "^(/[-\\w:@&?=+,.!/~*\'%$_;\\(\\)]*)?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/UrlValidator;->PATH_PATTERN:Ljava/util/regex/Pattern;

    .line 152
    const-string v0, "^(.*)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/UrlValidator;->QUERY_PATTERN:Ljava/util/regex/Pattern;

    .line 155
    const-string v0, "^\\p{ASCII}+$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/UrlValidator;->ASCII_PATTERN:Ljava/util/regex/Pattern;

    .line 158
    const-string v0, "^:(\\d{1,5})$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/routines/UrlValidator;->PORT_PATTERN:Ljava/util/regex/Pattern;

    .line 179
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "http"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "https"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "ftp"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/commons/validator/routines/UrlValidator;->DEFAULT_SCHEMES:[Ljava/lang/String;

    .line 184
    new-instance v0, Lorg/apache/commons/validator/routines/UrlValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/UrlValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/UrlValidator;->DEFAULT_URL_VALIDATOR:Lorg/apache/commons/validator/routines/UrlValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 198
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/routines/UrlValidator;-><init>([Ljava/lang/String;)V

    .line 199
    return-void
.end method

.method public constructor <init>(J)V
    .registers 4
    .param p1, "options"    # J

    .prologue
    const/4 v0, 0x0

    .line 220
    invoke-direct {p0, v0, v0, p1, p2}, Lorg/apache/commons/validator/routines/UrlValidator;-><init>([Ljava/lang/String;Lorg/apache/commons/validator/routines/RegexValidator;J)V

    .line 221
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/validator/routines/RegexValidator;J)V
    .registers 5
    .param p1, "authorityValidator"    # Lorg/apache/commons/validator/routines/RegexValidator;
    .param p2, "options"    # J

    .prologue
    .line 243
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/apache/commons/validator/routines/UrlValidator;-><init>([Ljava/lang/String;Lorg/apache/commons/validator/routines/RegexValidator;J)V

    .line 244
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 4
    .param p1, "schemes"    # [Ljava/lang/String;

    .prologue
    .line 210
    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/validator/routines/UrlValidator;-><init>([Ljava/lang/String;J)V

    .line 211
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;J)V
    .registers 5
    .param p1, "schemes"    # [Ljava/lang/String;
    .param p2, "options"    # J

    .prologue
    .line 231
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lorg/apache/commons/validator/routines/UrlValidator;-><init>([Ljava/lang/String;Lorg/apache/commons/validator/routines/RegexValidator;J)V

    .line 232
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Lorg/apache/commons/validator/routines/RegexValidator;J)V
    .registers 7
    .param p1, "schemes"    # [Ljava/lang/String;
    .param p2, "authorityValidator"    # Lorg/apache/commons/validator/routines/RegexValidator;
    .param p3, "options"    # J

    .prologue
    .line 255
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 256
    iput-wide p3, p0, Lorg/apache/commons/validator/routines/UrlValidator;->options:J

    .line 258
    const-wide/16 v0, 0x1

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/validator/routines/UrlValidator;->isOn(J)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 259
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    iput-object v0, p0, Lorg/apache/commons/validator/routines/UrlValidator;->allowedSchemes:Ljava/util/Set;

    .line 268
    :goto_11
    iput-object p2, p0, Lorg/apache/commons/validator/routines/UrlValidator;->authorityValidator:Lorg/apache/commons/validator/routines/RegexValidator;

    .line 270
    return-void

    .line 261
    :cond_14
    if-nez p1, :cond_18

    .line 262
    sget-object p1, Lorg/apache/commons/validator/routines/UrlValidator;->DEFAULT_SCHEMES:[Ljava/lang/String;

    .line 264
    :cond_18
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/routines/UrlValidator;->allowedSchemes:Ljava/util/Set;

    .line 265
    iget-object v0, p0, Lorg/apache/commons/validator/routines/UrlValidator;->allowedSchemes:Ljava/util/Set;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_11
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/UrlValidator;
    .registers 1

    .prologue
    .line 191
    sget-object v0, Lorg/apache/commons/validator/routines/UrlValidator;->DEFAULT_URL_VALIDATOR:Lorg/apache/commons/validator/routines/UrlValidator;

    return-object v0
.end method

.method private isOff(J)Z
    .registers 7
    .param p1, "flag"    # J

    .prologue
    .line 499
    iget-wide v0, p0, Lorg/apache/commons/validator/routines/UrlValidator;->options:J

    and-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private isOn(J)Z
    .registers 7
    .param p1, "flag"    # J

    .prologue
    .line 487
    iget-wide v0, p0, Lorg/apache/commons/validator/routines/UrlValidator;->options:J

    and-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method


# virtual methods
.method protected countToken(Ljava/lang/String;Ljava/lang/String;)I
    .registers 6
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "target"    # Ljava/lang/String;

    .prologue
    const/4 v2, -0x1

    .line 466
    const/4 v1, 0x0

    .line 467
    .local v1, "tokenIndex":I
    const/4 v0, 0x0

    .line 468
    .local v0, "count":I
    :cond_3
    :goto_3
    if-eq v1, v2, :cond_10

    .line 469
    invoke-virtual {p2, p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 470
    if-le v1, v2, :cond_3

    .line 471
    add-int/lit8 v1, v1, 0x1

    .line 472
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 475
    :cond_10
    return v0
.end method

.method public isValid(Ljava/lang/String;)Z
    .registers 7
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 280
    if-nez p1, :cond_4

    .line 321
    :cond_3
    :goto_3
    return v3

    .line 284
    :cond_4
    sget-object v4, Lorg/apache/commons/validator/routines/UrlValidator;->ASCII_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v4, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 289
    sget-object v4, Lorg/apache/commons/validator/routines/UrlValidator;->URL_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v4, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 290
    .local v2, "urlMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 294
    const/4 v4, 0x2

    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 295
    .local v1, "scheme":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lorg/apache/commons/validator/routines/UrlValidator;->isValidScheme(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 299
    const/4 v4, 0x4

    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 300
    .local v0, "authority":Ljava/lang/String;
    const-string v4, "file"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const-string v4, ""

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    .line 309
    :cond_3c
    const/4 v4, 0x5

    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/validator/routines/UrlValidator;->isValidPath(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 313
    const/4 v4, 0x7

    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/validator/routines/UrlValidator;->isValidQuery(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 317
    const/16 v4, 0x9

    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/validator/routines/UrlValidator;->isValidFragment(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 321
    const/4 v3, 0x1

    goto :goto_3

    .line 304
    :cond_60
    invoke-virtual {p0, v0}, Lorg/apache/commons/validator/routines/UrlValidator;->isValidAuthority(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3c

    goto :goto_3
.end method

.method protected isValidAuthority(Ljava/lang/String;)Z
    .registers 12
    .param p1, "authority"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 358
    if-nez p1, :cond_5

    .line 400
    :cond_4
    :goto_4
    return v6

    .line 363
    :cond_5
    iget-object v8, p0, Lorg/apache/commons/validator/routines/UrlValidator;->authorityValidator:Lorg/apache/commons/validator/routines/RegexValidator;

    if-eqz v8, :cond_13

    .line 364
    iget-object v8, p0, Lorg/apache/commons/validator/routines/UrlValidator;->authorityValidator:Lorg/apache/commons/validator/routines/RegexValidator;

    invoke-virtual {v8, p1}, Lorg/apache/commons/validator/routines/RegexValidator;->isValid(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_13

    move v6, v7

    .line 365
    goto :goto_4

    .line 369
    :cond_13
    sget-object v8, Lorg/apache/commons/validator/routines/UrlValidator;->AUTHORITY_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v8, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 370
    .local v0, "authorityMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 374
    invoke-virtual {v0, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    .line 377
    .local v3, "hostLocation":Ljava/lang/String;
    const-wide/16 v8, 0x8

    invoke-direct {p0, v8, v9}, Lorg/apache/commons/validator/routines/UrlValidator;->isOn(J)Z

    move-result v8

    invoke-static {v8}, Lorg/apache/commons/validator/routines/DomainValidator;->getInstance(Z)Lorg/apache/commons/validator/routines/DomainValidator;

    move-result-object v1

    .line 378
    .local v1, "domainValidator":Lorg/apache/commons/validator/routines/DomainValidator;
    invoke-virtual {v1, v3}, Lorg/apache/commons/validator/routines/DomainValidator;->isValid(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3d

    .line 380
    invoke-static {}, Lorg/apache/commons/validator/routines/InetAddressValidator;->getInstance()Lorg/apache/commons/validator/routines/InetAddressValidator;

    move-result-object v4

    .line 382
    .local v4, "inetAddressValidator":Lorg/apache/commons/validator/routines/InetAddressValidator;
    invoke-virtual {v4, v3}, Lorg/apache/commons/validator/routines/InetAddressValidator;->isValid(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 388
    .end local v4    # "inetAddressValidator":Lorg/apache/commons/validator/routines/InetAddressValidator;
    :cond_3d
    const/4 v8, 0x2

    invoke-virtual {v0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    .line 389
    .local v5, "port":Ljava/lang/String;
    if-eqz v5, :cond_50

    .line 390
    sget-object v8, Lorg/apache/commons/validator/routines/UrlValidator;->PORT_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v8, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 395
    :cond_50
    const/4 v8, 0x3

    invoke-virtual {v0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 396
    .local v2, "extra":Ljava/lang/String;
    if-eqz v2, :cond_61

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-gtz v8, :cond_4

    :cond_61
    move v6, v7

    .line 400
    goto :goto_4
.end method

.method protected isValidFragment(Ljava/lang/String;)Z
    .registers 4
    .param p1, "fragment"    # Ljava/lang/String;

    .prologue
    .line 452
    if-nez p1, :cond_4

    .line 453
    const/4 v0, 0x1

    .line 456
    :goto_3
    return v0

    :cond_4
    const-wide/16 v0, 0x4

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/validator/routines/UrlValidator;->isOff(J)Z

    move-result v0

    goto :goto_3
.end method

.method protected isValidPath(Ljava/lang/String;)Z
    .registers 8
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 409
    if-nez p1, :cond_4

    .line 430
    :cond_3
    :goto_3
    return v3

    .line 413
    :cond_4
    sget-object v4, Lorg/apache/commons/validator/routines/UrlValidator;->PATH_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v4, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 417
    const-string v4, "//"

    invoke-virtual {p0, v4, p1}, Lorg/apache/commons/validator/routines/UrlValidator;->countToken(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 418
    .local v1, "slash2Count":I
    const-wide/16 v4, 0x2

    invoke-direct {p0, v4, v5}, Lorg/apache/commons/validator/routines/UrlValidator;->isOff(J)Z

    move-result v4

    if-eqz v4, :cond_20

    if-gtz v1, :cond_3

    .line 422
    :cond_20
    const-string v4, "/"

    invoke-virtual {p0, v4, p1}, Lorg/apache/commons/validator/routines/UrlValidator;->countToken(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 423
    .local v2, "slashCount":I
    const-string v4, ".."

    invoke-virtual {p0, v4, p1}, Lorg/apache/commons/validator/routines/UrlValidator;->countToken(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 424
    .local v0, "dot2Count":I
    if-lez v0, :cond_34

    .line 425
    sub-int v4, v2, v1

    add-int/lit8 v4, v4, -0x1

    if-le v4, v0, :cond_3

    .line 430
    :cond_34
    const/4 v3, 0x1

    goto :goto_3
.end method

.method protected isValidQuery(Ljava/lang/String;)Z
    .registers 3
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 439
    if-nez p1, :cond_4

    .line 440
    const/4 v0, 0x1

    .line 443
    :goto_3
    return v0

    :cond_4
    sget-object v0, Lorg/apache/commons/validator/routines/UrlValidator;->QUERY_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    goto :goto_3
.end method

.method protected isValidScheme(Ljava/lang/String;)Z
    .registers 5
    .param p1, "scheme"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 333
    if-nez p1, :cond_4

    .line 348
    :cond_3
    :goto_3
    return v0

    .line 337
    :cond_4
    sget-object v1, Lorg/apache/commons/validator/routines/UrlValidator;->SCHEME_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 341
    const-wide/16 v1, 0x1

    invoke-direct {p0, v1, v2}, Lorg/apache/commons/validator/routines/UrlValidator;->isOff(J)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 343
    iget-object v1, p0, Lorg/apache/commons/validator/routines/UrlValidator;->allowedSchemes:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 348
    :cond_20
    const/4 v0, 0x1

    goto :goto_3
.end method
