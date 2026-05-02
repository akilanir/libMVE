.class public Lorg/apache/commons/validator/UrlValidator;
.super Ljava/lang/Object;
.source "UrlValidator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final ALLOW_2_SLASHES:I = 0x2

.field public static final ALLOW_ALL_SCHEMES:I = 0x1

.field private static final ALPHA_CHARS:Ljava/lang/String; = "a-zA-Z"

.field private static final ALPHA_NUMERIC_CHARS:Ljava/lang/String; = "a-zA-Z\\d"

.field private static final ALPHA_PATTERN:Ljava/util/regex/Pattern;

.field private static final ATOM:Ljava/lang/String; = "[^\\s;/@&=,.?:+$]+"

.field private static final ATOM_PATTERN:Ljava/util/regex/Pattern;

.field private static final AUTHORITY_CHARS_REGEX:Ljava/lang/String; = "\\p{Alnum}\\-\\."

.field private static final AUTHORITY_PATTERN:Ljava/util/regex/Pattern;

.field private static final AUTHORITY_REGEX:Ljava/lang/String; = "^([\\p{Alnum}\\-\\.]*)(:\\d*)?(.*)?"

.field private static final DOMAIN_PATTERN:Ljava/util/regex/Pattern;

.field private static final LEGAL_ASCII_PATTERN:Ljava/util/regex/Pattern;

.field public static final NO_FRAGMENTS:I = 0x4

.field private static final PARSE_AUTHORITY_EXTRA:I = 0x3

.field private static final PARSE_AUTHORITY_HOST_IP:I = 0x1

.field private static final PARSE_AUTHORITY_PORT:I = 0x2

.field private static final PARSE_URL_AUTHORITY:I = 0x4

.field private static final PARSE_URL_FRAGMENT:I = 0x9

.field private static final PARSE_URL_PATH:I = 0x5

.field private static final PARSE_URL_QUERY:I = 0x7

.field private static final PARSE_URL_SCHEME:I = 0x2

.field private static final PATH_PATTERN:Ljava/util/regex/Pattern;

.field private static final PORT_PATTERN:Ljava/util/regex/Pattern;

.field private static final QUERY_PATTERN:Ljava/util/regex/Pattern;

.field private static final SCHEME_PATTERN:Ljava/util/regex/Pattern;

.field private static final SPECIAL_CHARS:Ljava/lang/String; = ";/@&=,.?:+$"

.field private static final URL_PATTERN:Ljava/util/regex/Pattern;

.field private static final URL_REGEX:Ljava/lang/String; = "^(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\\?([^#]*))?(#(.*))?"

.field private static final VALID_CHARS:Ljava/lang/String; = "[^\\s;/@&=,.?:+$]"

.field private static final serialVersionUID:J = 0x55c09de4b76999L


# instance fields
.field private allowedSchemes:Ljava/util/Set;

.field protected defaultSchemes:[Ljava/lang/String;

.field private options:Lorg/apache/commons/validator/util/Flags;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 116
    const-string v0, "^(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\\?([^#]*))?(#(.*))?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/UrlValidator;->URL_PATTERN:Ljava/util/regex/Pattern;

    .line 137
    const-string v0, "^\\p{Alpha}[\\p{Alnum}\\+\\-\\.]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/UrlValidator;->SCHEME_PATTERN:Ljava/util/regex/Pattern;

    .line 142
    const-string v0, "^([\\p{Alnum}\\-\\.]*)(:\\d*)?(.*)?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/UrlValidator;->AUTHORITY_PATTERN:Ljava/util/regex/Pattern;

    .line 153
    const-string v0, "^(/[-\\w:@&?=+,.!/~*\'%$_;]*)?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/UrlValidator;->PATH_PATTERN:Ljava/util/regex/Pattern;

    .line 155
    const-string v0, "^(.*)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/UrlValidator;->QUERY_PATTERN:Ljava/util/regex/Pattern;

    .line 157
    const-string v0, "^\\p{ASCII}+$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/UrlValidator;->LEGAL_ASCII_PATTERN:Ljava/util/regex/Pattern;

    .line 159
    const-string v0, "^[^\\s;/@&=,.?:+$]+(\\.[^\\s;/@&=,.?:+$]+)*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/UrlValidator;->DOMAIN_PATTERN:Ljava/util/regex/Pattern;

    .line 162
    const-string v0, "^:(\\d{1,5})$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/UrlValidator;->PORT_PATTERN:Ljava/util/regex/Pattern;

    .line 164
    const-string v0, "^([^\\s;/@&=,.?:+$]+).*?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/UrlValidator;->ATOM_PATTERN:Ljava/util/regex/Pattern;

    .line 166
    const-string v0, "^[a-zA-Z]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/UrlValidator;->ALPHA_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 187
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/UrlValidator;-><init>([Ljava/lang/String;)V

    .line 188
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "options"    # I

    .prologue
    .line 209
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/validator/UrlValidator;-><init>([Ljava/lang/String;I)V

    .line 210
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 3
    .param p1, "schemes"    # [Ljava/lang/String;

    .prologue
    .line 199
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/validator/UrlValidator;-><init>([Ljava/lang/String;I)V

    .line 200
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;I)V
    .registers 6
    .param p1, "schemes"    # [Ljava/lang/String;
    .param p2, "options"    # I

    .prologue
    .line 219
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 171
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/validator/UrlValidator;->options:Lorg/apache/commons/validator/util/Flags;

    .line 176
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/UrlValidator;->allowedSchemes:Ljava/util/Set;

    .line 181
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

    iput-object v0, p0, Lorg/apache/commons/validator/UrlValidator;->defaultSchemes:[Ljava/lang/String;

    .line 220
    new-instance v0, Lorg/apache/commons/validator/util/Flags;

    int-to-long v1, p2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/validator/util/Flags;-><init>(J)V

    iput-object v0, p0, Lorg/apache/commons/validator/UrlValidator;->options:Lorg/apache/commons/validator/util/Flags;

    .line 222
    iget-object v0, p0, Lorg/apache/commons/validator/UrlValidator;->options:Lorg/apache/commons/validator/util/Flags;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/validator/util/Flags;->isOn(J)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 231
    :goto_33
    return-void

    .line 226
    :cond_34
    if-nez p1, :cond_38

    .line 227
    iget-object p1, p0, Lorg/apache/commons/validator/UrlValidator;->defaultSchemes:[Ljava/lang/String;

    .line 230
    :cond_38
    iget-object v0, p0, Lorg/apache/commons/validator/UrlValidator;->allowedSchemes:Ljava/util/Set;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_33
.end method


# virtual methods
.method protected countToken(Ljava/lang/String;Ljava/lang/String;)I
    .registers 6
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "target"    # Ljava/lang/String;

    .prologue
    const/4 v2, -0x1

    .line 461
    const/4 v1, 0x0

    .line 462
    .local v1, "tokenIndex":I
    const/4 v0, 0x0

    .line 463
    .local v0, "count":I
    :cond_3
    :goto_3
    if-eq v1, v2, :cond_10

    .line 464
    invoke-virtual {p2, p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 465
    if-le v1, v2, :cond_3

    .line 466
    add-int/lit8 v1, v1, 0x1

    .line 467
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 470
    :cond_10
    return v0
.end method

.method public isValid(Ljava/lang/String;)Z
    .registers 5
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 241
    if-nez p1, :cond_4

    .line 274
    :cond_3
    :goto_3
    return v1

    .line 244
    :cond_4
    sget-object v2, Lorg/apache/commons/validator/UrlValidator;->LEGAL_ASCII_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 249
    sget-object v2, Lorg/apache/commons/validator/UrlValidator;->URL_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 250
    .local v0, "urlMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 254
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/commons/validator/UrlValidator;->isValidScheme(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 258
    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/commons/validator/UrlValidator;->isValidAuthority(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 262
    const/4 v2, 0x5

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/commons/validator/UrlValidator;->isValidPath(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 266
    const/4 v2, 0x7

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/commons/validator/UrlValidator;->isValidQuery(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 270
    const/16 v2, 0x9

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/commons/validator/UrlValidator;->isValidFragment(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 274
    const/4 v1, 0x1

    goto :goto_3
.end method

.method protected isValidAuthority(Ljava/lang/String;)Z
    .registers 24
    .param p1, "authority"    # Ljava/lang/String;

    .prologue
    .line 311
    if-nez p1, :cond_5

    .line 312
    const/16 v19, 0x0

    .line 395
    :goto_4
    return v19

    .line 315
    :cond_5
    invoke-static {}, Lorg/apache/commons/validator/routines/InetAddressValidator;->getInstance()Lorg/apache/commons/validator/routines/InetAddressValidator;

    move-result-object v11

    .line 318
    .local v11, "inetAddressValidator":Lorg/apache/commons/validator/routines/InetAddressValidator;
    sget-object v19, Lorg/apache/commons/validator/UrlValidator;->AUTHORITY_PATTERN:Ljava/util/regex/Pattern;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 319
    .local v4, "authorityMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v19

    if-nez v19, :cond_1c

    .line 320
    const/16 v19, 0x0

    goto :goto_4

    .line 323
    :cond_1c
    const/4 v9, 0x0

    .line 325
    .local v9, "hostname":Z
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    .line 326
    .local v8, "hostIP":Ljava/lang/String;
    invoke-virtual {v11, v8}, Lorg/apache/commons/validator/routines/InetAddressValidator;->isValid(Ljava/lang/String;)Z

    move-result v12

    .line 328
    .local v12, "ipV4Address":Z
    if-nez v12, :cond_37

    .line 330
    sget-object v19, Lorg/apache/commons/validator/UrlValidator;->DOMAIN_PATTERN:Ljava/util/regex/Pattern;

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/regex/Matcher;->matches()Z

    move-result v9

    .line 334
    :cond_37
    if-eqz v9, :cond_de

    .line 337
    invoke-virtual {v8}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    .line 338
    .local v5, "chars":[C
    const/16 v17, 0x1

    .line 339
    .local v17, "size":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_40
    array-length v0, v5

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v10, v0, :cond_56

    .line 340
    aget-char v19, v5, v10

    const/16 v20, 0x2e

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_53

    .line 341
    add-int/lit8 v17, v17, 0x1

    .line 339
    :cond_53
    add-int/lit8 v10, v10, 0x1

    goto :goto_40

    .line 344
    :cond_56
    move/from16 v0, v17

    new-array v6, v0, [Ljava/lang/String;

    .line 345
    .local v6, "domainSegment":[Ljava/lang/String;
    const/4 v13, 0x1

    .line 346
    .local v13, "match":Z
    const/4 v15, 0x0

    .line 347
    .local v15, "segmentCount":I
    const/16 v16, 0x0

    .line 349
    .local v16, "segmentLength":I
    :cond_5e
    :goto_5e
    if-eqz v13, :cond_96

    .line 350
    sget-object v19, Lorg/apache/commons/validator/UrlValidator;->ATOM_PATTERN:Ljava/util/regex/Pattern;

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 351
    .local v3, "atomMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v13

    .line 352
    if-eqz v13, :cond_5e

    .line 353
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v6, v15

    .line 354
    aget-object v19, v6, v15

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    add-int/lit8 v16, v19, 0x1

    .line 355
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v19

    move/from16 v0, v16

    move/from16 v1, v19

    if-lt v0, v1, :cond_8f

    const-string v8, ""

    .line 360
    :goto_8c
    add-int/lit8 v15, v15, 0x1

    goto :goto_5e

    .line 355
    :cond_8f
    move/from16 v0, v16

    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    goto :goto_8c

    .line 363
    .end local v3    # "atomMatcher":Ljava/util/regex/Matcher;
    :cond_96
    add-int/lit8 v19, v15, -0x1

    aget-object v18, v6, v19

    .line 364
    .local v18, "topLevel":Ljava/lang/String;
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_b2

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x4

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_b6

    .line 365
    :cond_b2
    const/16 v19, 0x0

    goto/16 :goto_4

    .line 369
    :cond_b6
    sget-object v19, Lorg/apache/commons/validator/UrlValidator;->ALPHA_PATTERN:Ljava/util/regex/Pattern;

    const/16 v20, 0x0

    const/16 v21, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/regex/Matcher;->matches()Z

    move-result v19

    if-nez v19, :cond_d4

    .line 370
    const/16 v19, 0x0

    goto/16 :goto_4

    .line 374
    :cond_d4
    const/16 v19, 0x2

    move/from16 v0, v19

    if-ge v15, v0, :cond_de

    .line 375
    const/16 v19, 0x0

    goto/16 :goto_4

    .line 379
    .end local v5    # "chars":[C
    .end local v6    # "domainSegment":[Ljava/lang/String;
    .end local v10    # "i":I
    .end local v13    # "match":Z
    .end local v15    # "segmentCount":I
    .end local v16    # "segmentLength":I
    .end local v17    # "size":I
    .end local v18    # "topLevel":Ljava/lang/String;
    :cond_de
    if-nez v9, :cond_e6

    if-nez v12, :cond_e6

    .line 380
    const/16 v19, 0x0

    goto/16 :goto_4

    .line 383
    :cond_e6
    const/16 v19, 0x2

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    .line 384
    .local v14, "port":Ljava/lang/String;
    if-eqz v14, :cond_102

    .line 385
    sget-object v19, Lorg/apache/commons/validator/UrlValidator;->PORT_PATTERN:Ljava/util/regex/Pattern;

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/regex/Matcher;->matches()Z

    move-result v19

    if-nez v19, :cond_102

    .line 386
    const/16 v19, 0x0

    goto/16 :goto_4

    .line 390
    :cond_102
    const/16 v19, 0x3

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    .line 391
    .local v7, "extra":Ljava/lang/String;
    invoke-static {v7}, Lorg/apache/commons/validator/GenericValidator;->isBlankOrNull(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_114

    .line 392
    const/16 v19, 0x0

    goto/16 :goto_4

    .line 395
    :cond_114
    const/16 v19, 0x1

    goto/16 :goto_4
.end method

.method protected isValidFragment(Ljava/lang/String;)Z
    .registers 5
    .param p1, "fragment"    # Ljava/lang/String;

    .prologue
    .line 447
    if-nez p1, :cond_4

    .line 448
    const/4 v0, 0x1

    .line 451
    :goto_3
    return v0

    :cond_4
    iget-object v0, p0, Lorg/apache/commons/validator/UrlValidator;->options:Lorg/apache/commons/validator/util/Flags;

    const-wide/16 v1, 0x4

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/validator/util/Flags;->isOff(J)Z

    move-result v0

    goto :goto_3
.end method

.method protected isValidPath(Ljava/lang/String;)Z
    .registers 9
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 404
    if-nez p1, :cond_4

    .line 425
    :cond_3
    :goto_3
    return v3

    .line 408
    :cond_4
    sget-object v4, Lorg/apache/commons/validator/UrlValidator;->PATH_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v4, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 412
    const-string v4, "//"

    invoke-virtual {p0, v4, p1}, Lorg/apache/commons/validator/UrlValidator;->countToken(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 413
    .local v1, "slash2Count":I
    iget-object v4, p0, Lorg/apache/commons/validator/UrlValidator;->options:Lorg/apache/commons/validator/util/Flags;

    const-wide/16 v5, 0x2

    invoke-virtual {v4, v5, v6}, Lorg/apache/commons/validator/util/Flags;->isOff(J)Z

    move-result v4

    if-eqz v4, :cond_22

    if-gtz v1, :cond_3

    .line 417
    :cond_22
    const-string v4, "/"

    invoke-virtual {p0, v4, p1}, Lorg/apache/commons/validator/UrlValidator;->countToken(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 418
    .local v2, "slashCount":I
    const-string v4, ".."

    invoke-virtual {p0, v4, p1}, Lorg/apache/commons/validator/UrlValidator;->countToken(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 419
    .local v0, "dot2Count":I
    if-lez v0, :cond_36

    .line 420
    sub-int v4, v2, v1

    add-int/lit8 v4, v4, -0x1

    if-le v4, v0, :cond_3

    .line 425
    :cond_36
    const/4 v3, 0x1

    goto :goto_3
.end method

.method protected isValidQuery(Ljava/lang/String;)Z
    .registers 3
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 434
    if-nez p1, :cond_4

    .line 435
    const/4 v0, 0x1

    .line 438
    :goto_3
    return v0

    :cond_4
    sget-object v0, Lorg/apache/commons/validator/UrlValidator;->QUERY_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    goto :goto_3
.end method

.method protected isValidScheme(Ljava/lang/String;)Z
    .registers 6
    .param p1, "scheme"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 286
    if-nez p1, :cond_4

    .line 301
    :cond_3
    :goto_3
    return v0

    .line 290
    :cond_4
    sget-object v1, Lorg/apache/commons/validator/UrlValidator;->SCHEME_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 294
    iget-object v1, p0, Lorg/apache/commons/validator/UrlValidator;->options:Lorg/apache/commons/validator/util/Flags;

    const-wide/16 v2, 0x1

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/validator/util/Flags;->isOff(J)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 296
    iget-object v1, p0, Lorg/apache/commons/validator/UrlValidator;->allowedSchemes:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 301
    :cond_22
    const/4 v0, 0x1

    goto :goto_3
.end method
