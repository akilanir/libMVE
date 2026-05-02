.class public abstract Lorg/apache/commons/digester/AbstractObjectCreationFactory;
.super Ljava/lang/Object;
.source "AbstractObjectCreationFactory.java"

# interfaces
.implements Lorg/apache/commons/digester/ObjectCreationFactory;


# instance fields
.field protected digester:Lorg/apache/commons/digester/Digester;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/AbstractObjectCreationFactory;->digester:Lorg/apache/commons/digester/Digester;

    .line 28
    return-void
.end method


# virtual methods
.method public abstract createObject(Lorg/xml/sax/Attributes;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public getDigester()Lorg/apache/commons/digester/Digester;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lorg/apache/commons/digester/AbstractObjectCreationFactory;->digester:Lorg/apache/commons/digester/Digester;

    return-object v0
.end method

.method public setDigester(Lorg/apache/commons/digester/Digester;)V
    .registers 2
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 74
    iput-object p1, p0, Lorg/apache/commons/digester/AbstractObjectCreationFactory;->digester:Lorg/apache/commons/digester/Digester;

    .line 76
    return-void
.end method
