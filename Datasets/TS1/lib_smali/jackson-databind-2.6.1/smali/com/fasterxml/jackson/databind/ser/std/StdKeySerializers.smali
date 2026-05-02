.class public Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;
.super Ljava/lang/Object;
.source "StdKeySerializers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$CalendarKeySerializer;,
        Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$DateKeySerializer;,
        Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$StringKeySerializer;,
        Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$Default;
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

    .line 15
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$StringKeySerializer;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$StringKeySerializer;-><init>()V

    sput-object v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->DEFAULT_STRING_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 17
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
    .line 63
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
    .line 59
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->getStdKeySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Ljava/lang/Class;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    return-object v0
.end method

.method public static getStdKeySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Ljava/lang/Class;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 5
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
    .line 29
    .local p1, "rawKeyType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_52

    .line 30
    const-class v0, Ljava/lang/String;

    if-ne p1, v0, :cond_9

    .line 31
    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->DEFAULT_STRING_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 51
    :goto_8
    return-object v0

    .line 33
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

    .line 35
    :cond_1b
    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->DEFAULT_KEY_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    goto :goto_8

    .line 37
    :cond_1e
    const-class v0, Ljava/lang/Class;

    if-ne p1, v0, :cond_29

    .line 38
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$Default;

    const/4 v1, 0x3

    invoke-direct {v0, v1, p1}, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$Default;-><init>(ILjava/lang/Class;)V

    goto :goto_8

    .line 40
    :cond_29
    const-class v0, Ljava/util/Date;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 41
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$Default;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p1}, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$Default;-><init>(ILjava/lang/Class;)V

    goto :goto_8

    .line 43
    :cond_38
    const-class v0, Ljava/util/Calendar;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_47

    .line 44
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$Default;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p1}, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$Default;-><init>(ILjava/lang/Class;)V

    goto :goto_8

    .line 47
    :cond_47
    const-class v0, Ljava/util/UUID;

    if-ne p1, v0, :cond_52

    .line 48
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$Default;

    const/4 v1, 0x4

    invoke-direct {v0, v1, p1}, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers$Default;-><init>(ILjava/lang/Class;)V

    goto :goto_8

    .line 51
    :cond_52
    if-eqz p2, :cond_57

    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->DEFAULT_KEY_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    goto :goto_8

    :cond_57
    const/4 v0, 0x0

    goto :goto_8
.end method
