.class Lcom/stericson/RootTools/internal/RootToolsInternalMethods$7;
.super Lcom/stericson/RootTools/execution/CommandCapture;
.source "RootToolsInternalMethods.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getFilePermissionsSymlinks(Ljava/lang/String;)Lcom/stericson/RootTools/containers/Permissions;
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
    .line 844
    iput-object p1, p0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$7;->this$0:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    invoke-direct {p0, p2, p3, p4}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public output(ILjava/lang/String;)V
    .registers 9
    .param p1, "id"    # I
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 847
    const/4 v4, 0x1

    if-ne p1, v4, :cond_16

    .line 848
    const-string v3, ""

    .line 850
    .local v3, "symlink_final":Ljava/lang/String;
    const-string v4, " "

    invoke-virtual {p2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 851
    .local v1, "lineArray":[Ljava/lang/String;
    const/4 v4, 0x0

    aget-object v4, v1, v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0xa

    if-eq v4, v5, :cond_17

    .line 874
    .end local v1    # "lineArray":[Ljava/lang/String;
    .end local v3    # "symlink_final":Ljava/lang/String;
    :cond_16
    :goto_16
    return-void

    .line 855
    .restart local v1    # "lineArray":[Ljava/lang/String;
    .restart local v3    # "symlink_final":Ljava/lang/String;
    :cond_17
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Line "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 858
    :try_start_2d
    const-string v4, " "

    invoke-virtual {p2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 859
    .local v2, "symlink":[Ljava/lang/String;
    array-length v4, v2

    add-int/lit8 v4, v4, -0x2

    aget-object v4, v2, v4

    const-string v5, "->"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4a

    .line 860
    const-string v4, "Symlink found."

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 861
    array-length v4, v2

    add-int/lit8 v4, v4, -0x1

    aget-object v3, v2, v4
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_4a} :catch_65

    .line 866
    .end local v2    # "symlink":[Ljava/lang/String;
    :cond_4a
    :goto_4a
    :try_start_4a
    iget-object v4, p0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$7;->this$0:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    invoke-virtual {v4, p2}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getPermissions(Ljava/lang/String;)Lcom/stericson/RootTools/containers/Permissions;

    move-result-object v4

    sput-object v4, Lcom/stericson/RootTools/internal/InternalVariables;->permissions:Lcom/stericson/RootTools/containers/Permissions;

    .line 867
    sget-object v4, Lcom/stericson/RootTools/internal/InternalVariables;->permissions:Lcom/stericson/RootTools/containers/Permissions;

    if-eqz v4, :cond_16

    .line 868
    sget-object v4, Lcom/stericson/RootTools/internal/InternalVariables;->permissions:Lcom/stericson/RootTools/containers/Permissions;

    invoke-virtual {v4, v3}, Lcom/stericson/RootTools/containers/Permissions;->setSymlink(Ljava/lang/String;)V
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_5b} :catch_5c

    goto :goto_16

    .line 870
    :catch_5c
    move-exception v0

    .line 871
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    goto :goto_16

    .line 863
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_65
    move-exception v4

    goto :goto_4a
.end method
