.class Landroid/content/res/XResources$XMLInstanceDetails;
.super Ljava/lang/Object;
.source "XResources.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/content/res/XResources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "XMLInstanceDetails"
.end annotation


# instance fields
.field public final callbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet",
            "<",
            "Lde/robv/android/xposed/callbacks/XC_LayoutInflated;",
            ">;"
        }
    .end annotation
.end field

.field public final res:Landroid/content/res/XResources;

.field public final resNames:Landroid/content/res/XResources$ResourceNames;

.field final synthetic this$0:Landroid/content/res/XResources;

.field public final variant:Ljava/lang/String;


# direct methods
.method private constructor <init>(Landroid/content/res/XResources;Landroid/content/res/XResources$ResourceNames;Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;)V
    .registers 5
    .param p2, "resNames"    # Landroid/content/res/XResources$ResourceNames;
    .param p3, "variant"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/XResources$ResourceNames;",
            "Ljava/lang/String;",
            "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet",
            "<",
            "Lde/robv/android/xposed/callbacks/XC_LayoutInflated;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1148
    .local p4, "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;"
    iput-object p1, p0, Landroid/content/res/XResources$XMLInstanceDetails;->this$0:Landroid/content/res/XResources;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1146
    iput-object p1, p0, Landroid/content/res/XResources$XMLInstanceDetails;->res:Landroid/content/res/XResources;

    .line 1149
    iput-object p2, p0, Landroid/content/res/XResources$XMLInstanceDetails;->resNames:Landroid/content/res/XResources$ResourceNames;

    .line 1150
    iput-object p3, p0, Landroid/content/res/XResources$XMLInstanceDetails;->variant:Ljava/lang/String;

    .line 1151
    iput-object p4, p0, Landroid/content/res/XResources$XMLInstanceDetails;->callbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    .line 1152
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/res/XResources;Landroid/content/res/XResources$ResourceNames;Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;Landroid/content/res/XResources$XMLInstanceDetails;)V
    .registers 6

    .prologue
    .line 1148
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/content/res/XResources$XMLInstanceDetails;-><init>(Landroid/content/res/XResources;Landroid/content/res/XResources$ResourceNames;Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;)V

    return-void
.end method
