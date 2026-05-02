.class public Lorg/apache/commons/validator/DateValidator;
.super Ljava/lang/Object;
.source "DateValidator.java"


# static fields
.field private static final DATE_VALIDATOR:Lorg/apache/commons/validator/DateValidator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 41
    new-instance v0, Lorg/apache/commons/validator/DateValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/DateValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/DateValidator;->DATE_VALIDATOR:Lorg/apache/commons/validator/DateValidator;

    return-void
.end method

.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/validator/DateValidator;
    .registers 1

    .prologue
    .line 48
    sget-object v0, Lorg/apache/commons/validator/DateValidator;->DATE_VALIDATOR:Lorg/apache/commons/validator/DateValidator;

    return-object v0
.end method


# virtual methods
.method public isValid(Ljava/lang/String;Ljava/lang/String;Z)Z
    .registers 9
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "datePattern"    # Ljava/lang/String;
    .param p3, "strict"    # Z

    .prologue
    const/4 v2, 0x0

    .line 72
    if-eqz p1, :cond_b

    if-eqz p2, :cond_b

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    if-gtz v3, :cond_c

    .line 92
    :cond_b
    :goto_b
    return v2

    .line 79
    :cond_c
    new-instance v1, Ljava/text/SimpleDateFormat;

    invoke-direct {v1, p2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 80
    .local v1, "formatter":Ljava/text/SimpleDateFormat;
    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    .line 83
    :try_start_14
    invoke-virtual {v1, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_17
    .catch Ljava/text/ParseException; {:try_start_14 .. :try_end_17} :catch_25

    .line 88
    if-eqz p3, :cond_23

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v3, v4, :cond_b

    .line 92
    :cond_23
    const/4 v2, 0x1

    goto :goto_b

    .line 84
    :catch_25
    move-exception v0

    .line 85
    .local v0, "e":Ljava/text/ParseException;
    goto :goto_b
.end method

.method public isValid(Ljava/lang/String;Ljava/util/Locale;)Z
    .registers 8
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    const/4 v4, 0x3

    const/4 v2, 0x0

    .line 107
    if-nez p1, :cond_5

    .line 129
    :goto_4
    return v2

    .line 111
    :cond_5
    const/4 v1, 0x0

    .line 112
    .local v1, "formatter":Ljava/text/DateFormat;
    if-eqz p2, :cond_14

    .line 113
    invoke-static {v4, p2}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v1

    .line 121
    :goto_c
    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->setLenient(Z)V

    .line 124
    :try_start_f
    invoke-virtual {v1, p1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_12
    .catch Ljava/text/ParseException; {:try_start_f .. :try_end_12} :catch_1d

    .line 129
    const/4 v2, 0x1

    goto :goto_4

    .line 115
    :cond_14
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-static {v4, v3}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v1

    goto :goto_c

    .line 125
    :catch_1d
    move-exception v0

    .line 126
    .local v0, "e":Ljava/text/ParseException;
    goto :goto_4
.end method
