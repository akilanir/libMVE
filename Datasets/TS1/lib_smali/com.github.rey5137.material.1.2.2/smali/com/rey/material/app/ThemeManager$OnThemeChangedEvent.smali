.class public Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;
.super Ljava/lang/Object;
.source "ThemeManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/ThemeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OnThemeChangedEvent"
.end annotation


# instance fields
.field public final theme:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "theme"    # I

    .prologue
    .line 267
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 268
    iput p1, p0, Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;->theme:I

    .line 269
    return-void
.end method
