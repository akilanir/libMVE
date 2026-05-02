.class public interface abstract Lcom/rey/material/app/ThemeManager$EventDispatcher;
.super Ljava/lang/Object;
.source "ThemeManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/ThemeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "EventDispatcher"
.end annotation


# virtual methods
.method public abstract dispatchThemeChanged(I)V
.end method

.method public abstract registerListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V
.end method

.method public abstract unregisterListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V
.end method
