.class Lcom/greysonparrelli/permiso/Permiso$3;
.super Ljava/lang/Object;
.source "Permiso.java"

# interfaces
.implements Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/greysonparrelli/permiso/Permiso;->linkToExistingRequestIfPossible(Lcom/greysonparrelli/permiso/Permiso$RequestData;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/greysonparrelli/permiso/Permiso;

.field final synthetic val$activeRequest:Lcom/greysonparrelli/permiso/Permiso$RequestData;

.field final synthetic val$newRequest:Lcom/greysonparrelli/permiso/Permiso$RequestData;

.field final synthetic val$originalOnResultListener:Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;


# direct methods
.method constructor <init>(Lcom/greysonparrelli/permiso/Permiso;Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;Lcom/greysonparrelli/permiso/Permiso$RequestData;Lcom/greysonparrelli/permiso/Permiso$RequestData;)V
    .registers 5

    .prologue
    .line 217
    iput-object p1, p0, Lcom/greysonparrelli/permiso/Permiso$3;->this$0:Lcom/greysonparrelli/permiso/Permiso;

    iput-object p2, p0, Lcom/greysonparrelli/permiso/Permiso$3;->val$originalOnResultListener:Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;

    iput-object p3, p0, Lcom/greysonparrelli/permiso/Permiso$3;->val$newRequest:Lcom/greysonparrelli/permiso/Permiso$RequestData;

    iput-object p4, p0, Lcom/greysonparrelli/permiso/Permiso$3;->val$activeRequest:Lcom/greysonparrelli/permiso/Permiso$RequestData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionResult(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)V
    .registers 9
    .param p1, "resultSet"    # Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    .prologue
    .line 221
    iget-object v5, p0, Lcom/greysonparrelli/permiso/Permiso$3;->val$originalOnResultListener:Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;

    invoke-interface {v5, p1}, Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;->onPermissionResult(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)V

    .line 224
    iget-object v5, p0, Lcom/greysonparrelli/permiso/Permiso$3;->val$newRequest:Lcom/greysonparrelli/permiso/Permiso$RequestData;

    iget-object v5, v5, Lcom/greysonparrelli/permiso/Permiso$RequestData;->resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    # invokes: Lcom/greysonparrelli/permiso/Permiso$ResultSet;->getUngrantedPermissions()[Ljava/lang/String;
    invoke-static {v5}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->access$500(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)[Ljava/lang/String;

    move-result-object v4

    .line 225
    .local v4, "unsatisfied":[Ljava/lang/String;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_10
    if-ge v1, v2, :cond_2a

    aget-object v3, v0, v1

    .line 226
    .local v3, "permission":Ljava/lang/String;
    iget-object v5, p0, Lcom/greysonparrelli/permiso/Permiso$3;->val$newRequest:Lcom/greysonparrelli/permiso/Permiso$RequestData;

    iget-object v5, v5, Lcom/greysonparrelli/permiso/Permiso$RequestData;->resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    # getter for: Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;
    invoke-static {v5}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->access$600(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)Ljava/util/Map;

    move-result-object v5

    invoke-virtual {p1, v3}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-interface {v5, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 230
    .end local v3    # "permission":Ljava/lang/String;
    :cond_2a
    iget-object v5, p0, Lcom/greysonparrelli/permiso/Permiso$3;->val$newRequest:Lcom/greysonparrelli/permiso/Permiso$RequestData;

    iget-object v5, v5, Lcom/greysonparrelli/permiso/Permiso$RequestData;->onResultListener:Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;

    iget-object v6, p0, Lcom/greysonparrelli/permiso/Permiso$3;->val$newRequest:Lcom/greysonparrelli/permiso/Permiso$RequestData;

    iget-object v6, v6, Lcom/greysonparrelli/permiso/Permiso$RequestData;->resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    invoke-interface {v5, v6}, Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;->onPermissionResult(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)V

    .line 231
    return-void
.end method

.method public varargs onRationaleRequested(Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;[Ljava/lang/String;)V
    .registers 4
    .param p1, "callback"    # Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;
    .param p2, "permissions"    # [Ljava/lang/String;

    .prologue
    .line 235
    iget-object v0, p0, Lcom/greysonparrelli/permiso/Permiso$3;->val$activeRequest:Lcom/greysonparrelli/permiso/Permiso$RequestData;

    iget-object v0, v0, Lcom/greysonparrelli/permiso/Permiso$RequestData;->onResultListener:Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;

    invoke-interface {v0, p1, p2}, Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;->onRationaleRequested(Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;[Ljava/lang/String;)V

    .line 236
    return-void
.end method
