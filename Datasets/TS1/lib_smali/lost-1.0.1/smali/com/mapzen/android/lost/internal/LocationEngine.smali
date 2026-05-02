.class public abstract Lcom/mapzen/android/lost/internal/LocationEngine;
.super Ljava/lang/Object;
.source "LocationEngine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mapzen/android/lost/internal/LocationEngine$Callback;
    }
.end annotation


# instance fields
.field private final callback:Lcom/mapzen/android/lost/internal/LocationEngine$Callback;

.field private final context:Landroid/content/Context;

.field private request:Lcom/mapzen/android/lost/api/LocationRequest;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/mapzen/android/lost/internal/LocationEngine$Callback;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callback"    # Lcom/mapzen/android/lost/internal/LocationEngine$Callback;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/mapzen/android/lost/internal/LocationEngine;->context:Landroid/content/Context;

    .line 19
    iput-object p2, p0, Lcom/mapzen/android/lost/internal/LocationEngine;->callback:Lcom/mapzen/android/lost/internal/LocationEngine$Callback;

    .line 20
    return-void
.end method


# virtual methods
.method protected abstract disable()V
.end method

.method protected abstract enable()V
.end method

.method protected getCallback()Lcom/mapzen/android/lost/internal/LocationEngine$Callback;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/LocationEngine;->callback:Lcom/mapzen/android/lost/internal/LocationEngine$Callback;

    return-object v0
.end method

.method protected getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/LocationEngine;->context:Landroid/content/Context;

    return-object v0
.end method

.method public abstract getLastLocation()Landroid/location/Location;
.end method

.method protected getRequest()Lcom/mapzen/android/lost/api/LocationRequest;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/LocationEngine;->request:Lcom/mapzen/android/lost/api/LocationRequest;

    return-object v0
.end method

.method public setRequest(Lcom/mapzen/android/lost/api/LocationRequest;)V
    .registers 2
    .param p1, "request"    # Lcom/mapzen/android/lost/api/LocationRequest;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/mapzen/android/lost/internal/LocationEngine;->request:Lcom/mapzen/android/lost/api/LocationRequest;

    .line 35
    if-eqz p1, :cond_8

    .line 36
    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/LocationEngine;->enable()V

    .line 40
    :goto_7
    return-void

    .line 38
    :cond_8
    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/LocationEngine;->disable()V

    goto :goto_7
.end method
