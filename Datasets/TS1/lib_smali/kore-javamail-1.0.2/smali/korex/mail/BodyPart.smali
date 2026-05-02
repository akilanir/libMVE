.class public abstract Lkorex/mail/BodyPart;
.super Ljava/lang/Object;
.source "BodyPart.java"

# interfaces
.implements Lkorex/mail/Part;


# instance fields
.field protected parent:Lkorex/mail/Multipart;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getParent()Lkorex/mail/Multipart;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lkorex/mail/BodyPart;->parent:Lkorex/mail/Multipart;

    return-object v0
.end method

.method setParent(Lkorex/mail/Multipart;)V
    .registers 2
    .param p1, "parent"    # Lkorex/mail/Multipart;

    .prologue
    .line 82
    iput-object p1, p0, Lkorex/mail/BodyPart;->parent:Lkorex/mail/Multipart;

    .line 83
    return-void
.end method
