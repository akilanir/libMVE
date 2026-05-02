.class public Lorg/bson/types/MaxKey;
.super Ljava/lang/Object;
.source "MaxKey.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x471a069809824011L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 34
    instance-of v0, p1, Lorg/bson/types/MaxKey;

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 39
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 44
    const-string v0, "MaxKey"

    return-object v0
.end method
