.class Lcom/stericson/RootTools/internal/RootToolsInternalMethods$1;
.super Lcom/stericson/RootTools/execution/CommandCapture;
.source "RootToolsInternalMethods.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->exists(Ljava/lang/String;Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

.field final synthetic val$result:Ljava/util/List;


# direct methods
.method varargs constructor <init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;Ljava/util/List;)V
    .registers 6
    .param p2, "x0"    # I
    .param p3, "x1"    # Z
    .param p4, "x2"    # [Ljava/lang/String;

    .prologue
    .line 416
    iput-object p1, p0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$1;->this$0:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    iput-object p5, p0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$1;->val$result:Ljava/util/List;

    invoke-direct {p0, p2, p3, p4}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public output(ILjava/lang/String;)V
    .registers 4
    .param p1, "arg0"    # I
    .param p2, "arg1"    # Ljava/lang/String;

    .prologue
    .line 419
    invoke-static {p2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 420
    iget-object v0, p0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$1;->val$result:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 421
    return-void
.end method
