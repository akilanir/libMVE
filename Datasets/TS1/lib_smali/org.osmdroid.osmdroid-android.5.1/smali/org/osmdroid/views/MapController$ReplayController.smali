.class Lorg/osmdroid/views/MapController$ReplayController;
.super Ljava/lang/Object;
.source "MapController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/views/MapController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReplayController"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;
    }
.end annotation


# instance fields
.field private mReplayList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/osmdroid/views/MapController;


# direct methods
.method private constructor <init>(Lorg/osmdroid/views/MapController;)V
    .registers 3

    .prologue
    .line 464
    iput-object p1, p0, Lorg/osmdroid/views/MapController$ReplayController;->this$0:Lorg/osmdroid/views/MapController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 465
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/MapController$ReplayController;->mReplayList:Ljava/util/LinkedList;

    .line 503
    return-void
.end method

.method synthetic constructor <init>(Lorg/osmdroid/views/MapController;Lorg/osmdroid/views/MapController$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/osmdroid/views/MapController;
    .param p2, "x1"    # Lorg/osmdroid/views/MapController$1;

    .prologue
    .line 464
    invoke-direct {p0, p1}, Lorg/osmdroid/views/MapController$ReplayController;-><init>(Lorg/osmdroid/views/MapController;)V

    return-void
.end method


# virtual methods
.method public animateTo(II)V
    .registers 8
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 472
    iget-object v0, p0, Lorg/osmdroid/views/MapController$ReplayController;->mReplayList:Ljava/util/LinkedList;

    new-instance v1, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;

    sget-object v2, Lorg/osmdroid/views/MapController$ReplayType;->AnimateToPoint:Lorg/osmdroid/views/MapController$ReplayType;

    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    const/4 v4, 0x0

    invoke-direct {v1, p0, v2, v3, v4}, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;-><init>(Lorg/osmdroid/views/MapController$ReplayController;Lorg/osmdroid/views/MapController$ReplayType;Landroid/graphics/Point;Lorg/osmdroid/api/IGeoPoint;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 473
    return-void
.end method

.method public animateTo(Lorg/osmdroid/api/IGeoPoint;)V
    .registers 6
    .param p1, "geoPoint"    # Lorg/osmdroid/api/IGeoPoint;

    .prologue
    .line 468
    iget-object v0, p0, Lorg/osmdroid/views/MapController$ReplayController;->mReplayList:Ljava/util/LinkedList;

    new-instance v1, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;

    sget-object v2, Lorg/osmdroid/views/MapController$ReplayType;->AnimateToGeoPoint:Lorg/osmdroid/views/MapController$ReplayType;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v2, v3, p1}, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;-><init>(Lorg/osmdroid/views/MapController$ReplayController;Lorg/osmdroid/views/MapController$ReplayType;Landroid/graphics/Point;Lorg/osmdroid/api/IGeoPoint;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 469
    return-void
.end method

.method public replayCalls()V
    .registers 6

    .prologue
    .line 484
    iget-object v2, p0, Lorg/osmdroid/views/MapController$ReplayController;->mReplayList:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;

    .line 485
    .local v1, "replay":Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;
    sget-object v2, Lorg/osmdroid/views/MapController$1;->$SwitchMap$org$osmdroid$views$MapController$ReplayType:[I

    # getter for: Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->mReplayType:Lorg/osmdroid/views/MapController$ReplayType;
    invoke-static {v1}, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->access$100(Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;)Lorg/osmdroid/views/MapController$ReplayType;

    move-result-object v3

    invoke-virtual {v3}, Lorg/osmdroid/views/MapController$ReplayType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_60

    goto :goto_6

    .line 487
    :pswitch_22
    iget-object v2, p0, Lorg/osmdroid/views/MapController$ReplayController;->this$0:Lorg/osmdroid/views/MapController;

    # getter for: Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->mGeoPoint:Lorg/osmdroid/api/IGeoPoint;
    invoke-static {v1}, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->access$200(Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;)Lorg/osmdroid/api/IGeoPoint;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/osmdroid/views/MapController;->animateTo(Lorg/osmdroid/api/IGeoPoint;)V

    goto :goto_6

    .line 490
    :pswitch_2c
    iget-object v2, p0, Lorg/osmdroid/views/MapController$ReplayController;->this$0:Lorg/osmdroid/views/MapController;

    # getter for: Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->mPoint:Landroid/graphics/Point;
    invoke-static {v1}, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->access$300(Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;)Landroid/graphics/Point;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Point;->x:I

    # getter for: Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->mPoint:Landroid/graphics/Point;
    invoke-static {v1}, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->access$300(Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;)Landroid/graphics/Point;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v4}, Lorg/osmdroid/views/MapController;->animateTo(II)V

    goto :goto_6

    .line 493
    :pswitch_3e
    iget-object v2, p0, Lorg/osmdroid/views/MapController$ReplayController;->this$0:Lorg/osmdroid/views/MapController;

    # getter for: Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->mGeoPoint:Lorg/osmdroid/api/IGeoPoint;
    invoke-static {v1}, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->access$200(Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;)Lorg/osmdroid/api/IGeoPoint;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/osmdroid/views/MapController;->setCenter(Lorg/osmdroid/api/IGeoPoint;)V

    goto :goto_6

    .line 496
    :pswitch_48
    iget-object v2, p0, Lorg/osmdroid/views/MapController$ReplayController;->this$0:Lorg/osmdroid/views/MapController;

    # getter for: Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->mPoint:Landroid/graphics/Point;
    invoke-static {v1}, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->access$300(Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;)Landroid/graphics/Point;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Point;->x:I

    # getter for: Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->mPoint:Landroid/graphics/Point;
    invoke-static {v1}, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;->access$300(Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;)Landroid/graphics/Point;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v4}, Lorg/osmdroid/views/MapController;->zoomToSpan(II)V

    goto :goto_6

    .line 500
    .end local v1    # "replay":Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;
    :cond_5a
    iget-object v2, p0, Lorg/osmdroid/views/MapController$ReplayController;->mReplayList:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V

    .line 501
    return-void

    .line 485
    :pswitch_data_60
    .packed-switch 0x1
        :pswitch_22
        :pswitch_2c
        :pswitch_3e
        :pswitch_48
    .end packed-switch
.end method

.method public setCenter(Lorg/osmdroid/api/IGeoPoint;)V
    .registers 6
    .param p1, "geoPoint"    # Lorg/osmdroid/api/IGeoPoint;

    .prologue
    .line 476
    iget-object v0, p0, Lorg/osmdroid/views/MapController$ReplayController;->mReplayList:Ljava/util/LinkedList;

    new-instance v1, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;

    sget-object v2, Lorg/osmdroid/views/MapController$ReplayType;->SetCenterPoint:Lorg/osmdroid/views/MapController$ReplayType;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v2, v3, p1}, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;-><init>(Lorg/osmdroid/views/MapController$ReplayController;Lorg/osmdroid/views/MapController$ReplayType;Landroid/graphics/Point;Lorg/osmdroid/api/IGeoPoint;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 477
    return-void
.end method

.method public zoomToSpan(II)V
    .registers 8
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 480
    iget-object v0, p0, Lorg/osmdroid/views/MapController$ReplayController;->mReplayList:Ljava/util/LinkedList;

    new-instance v1, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;

    sget-object v2, Lorg/osmdroid/views/MapController$ReplayType;->ZoomToSpanPoint:Lorg/osmdroid/views/MapController$ReplayType;

    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    const/4 v4, 0x0

    invoke-direct {v1, p0, v2, v3, v4}, Lorg/osmdroid/views/MapController$ReplayController$ReplayClass;-><init>(Lorg/osmdroid/views/MapController$ReplayController;Lorg/osmdroid/views/MapController$ReplayType;Landroid/graphics/Point;Lorg/osmdroid/api/IGeoPoint;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 481
    return-void
.end method
