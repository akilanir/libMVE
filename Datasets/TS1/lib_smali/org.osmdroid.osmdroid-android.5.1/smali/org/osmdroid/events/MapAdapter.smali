.class public abstract Lorg/osmdroid/events/MapAdapter;
.super Ljava/lang/Object;
.source "MapAdapter.java"

# interfaces
.implements Lorg/osmdroid/events/MapListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Lorg/osmdroid/events/ScrollEvent;)Z
    .registers 3
    .param p1, "event"    # Lorg/osmdroid/events/ScrollEvent;

    .prologue
    .line 13
    const/4 v0, 0x0

    return v0
.end method

.method public onZoom(Lorg/osmdroid/events/ZoomEvent;)Z
    .registers 3
    .param p1, "event"    # Lorg/osmdroid/events/ZoomEvent;

    .prologue
    .line 19
    const/4 v0, 0x0

    return v0
.end method
