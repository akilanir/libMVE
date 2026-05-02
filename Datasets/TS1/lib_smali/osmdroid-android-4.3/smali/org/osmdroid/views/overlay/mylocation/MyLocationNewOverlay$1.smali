.class Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay$1;
.super Ljava/lang/Object;
.source "MyLocationNewOverlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->onLocationChanged(Landroid/location/Location;Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

.field final synthetic val$location:Landroid/location/Location;


# direct methods
.method constructor <init>(Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;Landroid/location/Location;)V
    .registers 3

    .prologue
    .line 432
    iput-object p1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay$1;->this$0:Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

    iput-object p2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay$1;->val$location:Landroid/location/Location;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 435
    iget-object v2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay$1;->this$0:Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

    iget-object v3, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay$1;->val$location:Landroid/location/Location;

    invoke-virtual {v2, v3}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->setLocation(Landroid/location/Location;)V

    .line 437
    iget-object v2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay$1;->this$0:Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

    # getter for: Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mRunOnFirstFix:Ljava/util/LinkedList;
    invoke-static {v2}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->access$000(Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;)Ljava/util/LinkedList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 438
    .local v1, "runnable":Ljava/lang/Runnable;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    goto :goto_11

    .line 440
    .end local v1    # "runnable":Ljava/lang/Runnable;
    :cond_26
    iget-object v2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay$1;->this$0:Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

    # getter for: Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mRunOnFirstFix:Ljava/util/LinkedList;
    invoke-static {v2}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->access$000(Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;)Ljava/util/LinkedList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V

    .line 441
    return-void
.end method
