.class public final Lorg/apache/commons/beanutils/converters/SqlTimestampConverter;
.super Lorg/apache/commons/beanutils/converters/DateTimeConverter;
.source "SqlTimestampConverter.java"


# static fields
.field static class$java$sql$Timestamp:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;-><init>()V

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;-><init>(Ljava/lang/Object;)V

    .line 60
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 69
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method protected getDefaultType()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 69
    sget-object v0, Lorg/apache/commons/beanutils/converters/SqlTimestampConverter;->class$java$sql$Timestamp:Ljava/lang/Class;

    if-nez v0, :cond_d

    const-string v0, "java.sql.Timestamp"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/SqlTimestampConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/SqlTimestampConverter;->class$java$sql$Timestamp:Ljava/lang/Class;

    :goto_c
    return-object v0

    :cond_d
    sget-object v0, Lorg/apache/commons/beanutils/converters/SqlTimestampConverter;->class$java$sql$Timestamp:Ljava/lang/Class;

    goto :goto_c
.end method

.method protected getFormat(Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/text/DateFormat;
    .registers 5
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    const/4 v1, 0x3

    .line 81
    const/4 v0, 0x0

    .line 82
    .local v0, "format":Ljava/text/DateFormat;
    if-nez p1, :cond_e

    .line 83
    invoke-static {v1, v1}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v0

    .line 87
    :goto_8
    if-eqz p2, :cond_d

    .line 88
    invoke-virtual {v0, p2}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 90
    :cond_d
    return-object v0

    .line 85
    :cond_e
    invoke-static {v1, v1, p1}, Ljava/text/DateFormat;->getDateTimeInstance(IILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v0

    goto :goto_8
.end method
