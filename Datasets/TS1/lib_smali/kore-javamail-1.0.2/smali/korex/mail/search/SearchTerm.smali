.class public abstract Lkorex/mail/search/SearchTerm;
.super Ljava/lang/Object;
.source "SearchTerm.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x5c51ecc43e4e3b55L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract match(Lkorex/mail/Message;)Z
.end method
