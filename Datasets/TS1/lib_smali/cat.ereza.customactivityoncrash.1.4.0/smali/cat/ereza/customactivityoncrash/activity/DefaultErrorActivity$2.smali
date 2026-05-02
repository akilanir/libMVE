.class Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$2;
.super Ljava/lang/Object;
.source "DefaultErrorActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;


# direct methods
.method constructor <init>(Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;)V
    .registers 2

    .prologue
    .line 63
    iput-object p1, p0, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$2;->this$0:Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 66
    iget-object v0, p0, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$2;->this$0:Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;

    invoke-static {v0}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->closeApplication(Landroid/app/Activity;)V

    .line 67
    return-void
.end method
