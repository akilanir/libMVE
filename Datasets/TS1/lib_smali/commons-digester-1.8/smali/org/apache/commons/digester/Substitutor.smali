.class public abstract Lorg/apache/commons/digester/Substitutor;
.super Ljava/lang/Object;
.source "Substitutor.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract substitute(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract substitute(Lorg/xml/sax/Attributes;)Lorg/xml/sax/Attributes;
.end method
