.class public Lnl/siegmann/epublib/domain/SpineReference;
.super Lnl/siegmann/epublib/domain/ResourceReference;
.source "SpineReference.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x6def3598319aa0e8L


# instance fields
.field private linear:Z


# direct methods
.method public constructor <init>(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 3
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 22
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lnl/siegmann/epublib/domain/SpineReference;-><init>(Lnl/siegmann/epublib/domain/Resource;Z)V

    .line 23
    return-void
.end method

.method public constructor <init>(Lnl/siegmann/epublib/domain/Resource;Z)V
    .registers 4
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "linear"    # Z

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lnl/siegmann/epublib/domain/ResourceReference;-><init>(Lnl/siegmann/epublib/domain/Resource;)V

    .line 19
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnl/siegmann/epublib/domain/SpineReference;->linear:Z

    .line 28
    iput-boolean p2, p0, Lnl/siegmann/epublib/domain/SpineReference;->linear:Z

    .line 29
    return-void
.end method


# virtual methods
.method public isLinear()Z
    .registers 2

    .prologue
    .line 49
    iget-boolean v0, p0, Lnl/siegmann/epublib/domain/SpineReference;->linear:Z

    return v0
.end method

.method public setLinear(Z)V
    .registers 2
    .param p1, "linear"    # Z

    .prologue
    .line 53
    iput-boolean p1, p0, Lnl/siegmann/epublib/domain/SpineReference;->linear:Z

    .line 54
    return-void
.end method
