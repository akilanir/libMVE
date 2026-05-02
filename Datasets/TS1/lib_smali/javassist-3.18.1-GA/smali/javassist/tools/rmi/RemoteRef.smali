.class public Ljavassist/tools/rmi/RemoteRef;
.super Ljava/lang/Object;
.source "RemoteRef.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public classname:Ljava/lang/String;

.field public oid:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput p1, p0, Ljavassist/tools/rmi/RemoteRef;->oid:I

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/tools/rmi/RemoteRef;->classname:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .registers 3
    .param p1, "i"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput p1, p0, Ljavassist/tools/rmi/RemoteRef;->oid:I

    .line 34
    iput-object p2, p0, Ljavassist/tools/rmi/RemoteRef;->classname:Ljava/lang/String;

    .line 35
    return-void
.end method
