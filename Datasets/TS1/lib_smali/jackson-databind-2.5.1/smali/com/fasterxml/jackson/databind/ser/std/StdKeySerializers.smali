.class public Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;
.super Ljava/lang/Object;
.source "StdKeySerializers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$ClassKeySerializer;,
        Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$CalendarKeySerializer;,
        Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$DateKeySerializer;,
        Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$StringKeySerializer;
    }
.end annotation


# static fields
.field protected static final DEFAULT_KEY_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected static final DEFAULT_STRING_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializer;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializer;-><init>()V

    sput-object v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->DEFAULT_KEY_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 16
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$StringKeySerializer;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$StringKeySerializer;-><init>()V

    sput-object v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->DEFAULT_STRING_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefault()Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->DEFAULT_KEY_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    return-object v0
.end method

.method public static getStdKeySerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 4
    .param p0, "keyType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 58
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->getStdKeySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Ljava/lang/Class;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    return-object v0
.end method

.method public static getStdKeySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Ljava/lang/Class;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 4
    .param p0, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "useDefault"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Ljava/lang/Class",
            "<*>;Z)",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 32
    .local p1, "rawKeyType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_3b

    .line 33
    const-class v0, Ljava/lang/String;

    if-ne p1, v0, :cond_9

    .line 34
    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->DEFAULT_STRING_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 50
    :goto_8
    return-object v0

    .line 36
    :cond_9
    const-class v0, Ljava/lang/Object;

    if-eq p1, v0, :cond_1b

    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_1b

    const-class v0, Ljava/lang/Number;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 38
    :cond_1b
    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->DEFAULT_KEY_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    goto :goto_8

    .line 40
    :cond_1e
    const-class v0, Ljava/lang/Class;

    if-ne p1, v0, :cond_25

    .line 41
    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$ClassKeySerializer;->instance:Lcom/fasterxml/jackson/databind/JsonSerializer;

    goto :goto_8

    .line 43
    :cond_25
    const-class v0, Ljava/util/Date;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 44
    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$DateKeySerializer;->instance:Lcom/fasterxml/jackson/databind/JsonSerializer;

    goto :goto_8

    .line 46
    :cond_30
    const-class v0, Ljava/util/Calendar;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3b

    .line 47
    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$CalendarKeySerializer;->instance:Lcom/fasterxml/jackson/databind/JsonSerializer;

    goto :goto_8

    .line 50
    :cond_3b
    if-eqz p2, :cond_40

    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->DEFAULT_KEY_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    goto :goto_8

    :cond_40
    const/4 v0, 0x0

    goto :goto_8
.end method
