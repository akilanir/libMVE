.class Lcom/stericson/RootTools/internal/RootToolsInternalMethods$6;
.super Lcom/stericson/RootTools/execution/CommandCapture;
.source "RootToolsInternalMethods.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->isAccessGiven()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;


# direct methods
.method varargs constructor <init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;)V
    .registers 5
    .param p2, "x0"    # I
    .param p3, "x1"    # Z
    .param p4, "x2"    # [Ljava/lang/String;

    .prologue
    .line 773
    iput-object p1, p0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$6;->this$0:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    invoke-direct {p0, p2, p3, p4}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public output(ILjava/lang/String;)V
    .registers 8
    .param p1, "id"    # I
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 776
    const/4 v3, 0x2

    if-ne p1, v3, :cond_42

    .line 777
    new-instance v0, Ljava/util/HashSet;

    const-string v3, " "

    invoke-virtual {p2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 778
    .local v0, "ID":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_39

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 779
    .local v2, "userid":Ljava/lang/String;
    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 781
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "uid=0"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 782
    const/4 v3, 0x1

    sput-boolean v3, Lcom/stericson/RootTools/internal/InternalVariables;->accessGiven:Z

    .line 783
    const-string v3, "Access Given"

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 787
    .end local v2    # "userid":Ljava/lang/String;
    :cond_39
    sget-boolean v3, Lcom/stericson/RootTools/internal/InternalVariables;->accessGiven:Z

    if-nez v3, :cond_42

    .line 788
    const-string v3, "Access Denied?"

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 791
    .end local v0    # "ID":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_42
    return-void
.end method
