.class Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;
.super Ljava/lang/Object;
.source "MapController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/views/MapController$ReplayController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReplayClass"
.end annotation


# instance fields
.field private mGeoPoint:Lorg/osmdroid/api/IGeoPoint;

.field private mPoint:Landroid/graphics/Point;

.field private mReplayType:Lorg/osmdroid/views/MapController$ReplayType;

.field final synthetic this$1:Lorg/osmdroid/views/MapController$ReplayController;


# direct methods
.method public constructor <init>(Lorg/osmdroid/views/MapController$ReplayController;Lorg/osmdroid/views/MapController$ReplayType;Landroid/graphics/Point;Lorg/osmdroid/api/IGeoPoint;)V
    .registers 5
    .param p2, "mReplayType"    # Lorg/osmdroid/views/MapController$ReplayType;
    .param p3, "mPoint"    # Landroid/graphics/Point;
    .param p4, "mGeoPoint"    # Lorg/osmdroid/api/IGeoPoint;

    .prologue
    .line 508
    iput-object p1, p0, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->this$1:Lorg/osmdroid/views/MapController$ReplayController;

    .line 509
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 510
    iput-object p2, p0, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->mReplayType:Lorg/osmdroid/views/MapController$ReplayType;

    .line 511
    iput-object p3, p0, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->mPoint:Landroid/graphics/Point;

    .line 512
    iput-object p4, p0, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->mGeoPoint:Lorg/osmdroid/api/IGeoPoint;

    .line 513
    return-void
.end method

.method static synthetic access$100(Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;)Lorg/osmdroid/views/MapController$ReplayType;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;

    .prologue
    .line 503
    iget-object v0, p0, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->mReplayType:Lorg/osmdroid/views/MapController$ReplayType;

    return-object v0
.end method

.method static synthetic access$200(Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;)Lorg/osmdroid/api/IGeoPoint;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;

    .prologue
    .line 503
    iget-object v0, p0, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->mGeoPoint:Lorg/osmdroid/api/IGeoPoint;

    return-object v0
.end method

.method static synthetic access$300(Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;)Landroid/graphics/Point;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;

    .prologue
    .line 503
    iget-object v0, p0, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->mPoint:Landroid/graphics/Point;

    return-object v0
.end method
