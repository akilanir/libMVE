.class final Lorg/joda/time/DateTimeZone$Stub;
.super Ljava/lang/Object;
.source "DateTimeZone.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/DateTimeZone;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Stub"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x59d0fe6583cde51dL


# instance fields
.field private transient iID:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 1250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1251
    iput-object p1, p0, Lorg/joda/time/DateTimeZone$Stub;->iID:Ljava/lang/String;

    .line 1252
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1259
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/joda/time/DateTimeZone$Stub;->iID:Ljava/lang/String;

    .line 1260
    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .prologue
    .line 1263
    iget-object v0, p0, Lorg/joda/time/DateTimeZone$Stub;->iID:Ljava/lang/String;

    invoke-static {v0}, Lorg/joda/time/DateTimeZone;->forID(Ljava/lang/String;)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    return-object v0
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1255
    iget-object v0, p0, Lorg/joda/time/DateTimeZone$Stub;->iID:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1256
    return-void
.end method
