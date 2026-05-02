.class public final Lcom/google/gson/JsonNull;
.super Lcom/google/gson/JsonElement;
.source "JsonNull.java"


# static fields
.field private static final INSTANCE:Lcom/google/gson/JsonNull;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    new-instance v0, Lcom/google/gson/JsonNull;

    invoke-direct {v0}, Lcom/google/gson/JsonNull;-><init>()V

    sput-object v0, Lcom/google/gson/JsonNull;->INSTANCE:Lcom/google/gson/JsonNull;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/google/gson/JsonElement;-><init>()V

    .line 36
    return-void
.end method

.method static createJsonNull()Lcom/google/gson/JsonNull;
    .registers 1

    .prologue
    .line 70
    sget-object v0, Lcom/google/gson/JsonNull;->INSTANCE:Lcom/google/gson/JsonNull;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 56
    if-eq p0, p1, :cond_6

    instance-of v0, p1, Lcom/google/gson/JsonNull;

    if-eqz v0, :cond_8

    :cond_6
    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 48
    const-class v0, Lcom/google/gson/JsonNull;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method protected toString(Ljava/lang/Appendable;Lcom/google/gson/Escaper;)V
    .registers 4
    .param p1, "sb"    # Ljava/lang/Appendable;
    .param p2, "escaper"    # Lcom/google/gson/Escaper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    const-string v0, "null"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 41
    return-void
.end method
