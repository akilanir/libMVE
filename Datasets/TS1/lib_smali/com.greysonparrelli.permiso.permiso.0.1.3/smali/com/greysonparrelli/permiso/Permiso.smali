.class public Lcom/greysonparrelli/permiso/Permiso;
.super Ljava/lang/Object;
.source "Permiso.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/greysonparrelli/permiso/Permiso$ResultSet;,
        Lcom/greysonparrelli/permiso/Permiso$RequestData;,
        Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;,
        Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Permiso"

.field private static sInstance:Lcom/greysonparrelli/permiso/Permiso;


# instance fields
.field private mActiveRequestCode:I

.field private mActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private mCodesToRequests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/greysonparrelli/permiso/Permiso$RequestData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 50
    new-instance v0, Lcom/greysonparrelli/permiso/Permiso;

    invoke-direct {v0}, Lcom/greysonparrelli/permiso/Permiso;-><init>()V

    sput-object v0, Lcom/greysonparrelli/permiso/Permiso;->sInstance:Lcom/greysonparrelli/permiso/Permiso;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/4 v0, 0x1

    iput v0, p0, Lcom/greysonparrelli/permiso/Permiso;->mActiveRequestCode:I

    .line 68
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/greysonparrelli/permiso/Permiso;->mCodesToRequests:Ljava/util/Map;

    .line 69
    return-void
.end method

.method static synthetic access$200(Lcom/greysonparrelli/permiso/Permiso;I)V
    .registers 2
    .param p0, "x0"    # Lcom/greysonparrelli/permiso/Permiso;
    .param p1, "x1"    # I

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/greysonparrelli/permiso/Permiso;->makePermissionRequest(I)V

    return-void
.end method

.method private checkActivity()V
    .registers 3

    .prologue
    .line 269
    iget-object v0, p0, Lcom/greysonparrelli/permiso/Permiso;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_10

    .line 270
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No activity set. Either subclass PermisoActivity or call Permiso.setActivity() in onCreate() and onResume() of your Activity."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 272
    :cond_10
    return-void
.end method

.method public static getInstance()Lcom/greysonparrelli/permiso/Permiso;
    .registers 1

    .prologue
    .line 61
    sget-object v0, Lcom/greysonparrelli/permiso/Permiso;->sInstance:Lcom/greysonparrelli/permiso/Permiso;

    return-object v0
.end method

.method private linkToExistingRequestIfPossible(Lcom/greysonparrelli/permiso/Permiso$RequestData;)Z
    .registers 8
    .param p1, "newRequest"    # Lcom/greysonparrelli/permiso/Permiso$RequestData;

    .prologue
    .line 209
    const/4 v1, 0x0

    .line 212
    .local v1, "found":Z
    iget-object v4, p0, Lcom/greysonparrelli/permiso/Permiso;->mCodesToRequests:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/greysonparrelli/permiso/Permiso$RequestData;

    .line 215
    .local v0, "activeRequest":Lcom/greysonparrelli/permiso/Permiso$RequestData;
    iget-object v4, v0, Lcom/greysonparrelli/permiso/Permiso$RequestData;->resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    iget-object v5, p1, Lcom/greysonparrelli/permiso/Permiso$RequestData;->resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    # invokes: Lcom/greysonparrelli/permiso/Permiso$ResultSet;->containsAllUngrantedPermissions(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)Z
    invoke-static {v4, v5}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->access$400(Lcom/greysonparrelli/permiso/Permiso$ResultSet;Lcom/greysonparrelli/permiso/Permiso$ResultSet;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 216
    iget-object v3, v0, Lcom/greysonparrelli/permiso/Permiso$RequestData;->onResultListener:Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;

    .line 217
    .local v3, "originalOnResultListener":Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;
    new-instance v4, Lcom/greysonparrelli/permiso/Permiso$3;

    invoke-direct {v4, p0, v3, p1, v0}, Lcom/greysonparrelli/permiso/Permiso$3;-><init>(Lcom/greysonparrelli/permiso/Permiso;Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;Lcom/greysonparrelli/permiso/Permiso$RequestData;Lcom/greysonparrelli/permiso/Permiso$RequestData;)V

    iput-object v4, v0, Lcom/greysonparrelli/permiso/Permiso$RequestData;->onResultListener:Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;

    .line 238
    const/4 v1, 0x1

    .line 242
    .end local v0    # "activeRequest":Lcom/greysonparrelli/permiso/Permiso$RequestData;
    .end local v3    # "originalOnResultListener":Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;
    :cond_2b
    return v1
.end method

.method private makePermissionRequest(I)V
    .registers 5
    .param p1, "requestCode"    # I

    .prologue
    .line 260
    iget-object v1, p0, Lcom/greysonparrelli/permiso/Permiso;->mCodesToRequests:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/greysonparrelli/permiso/Permiso$RequestData;

    .line 261
    .local v0, "requestData":Lcom/greysonparrelli/permiso/Permiso$RequestData;
    iget-object v1, p0, Lcom/greysonparrelli/permiso/Permiso;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    iget-object v2, v0, Lcom/greysonparrelli/permiso/Permiso$RequestData;->resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    # invokes: Lcom/greysonparrelli/permiso/Permiso$ResultSet;->getUngrantedPermissions()[Ljava/lang/String;
    invoke-static {v2}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->access$500(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)[Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, p1}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 262
    return-void
.end method

.method private markRequestAsActive(Lcom/greysonparrelli/permiso/Permiso$RequestData;)I
    .registers 5
    .param p1, "requestData"    # Lcom/greysonparrelli/permiso/Permiso$RequestData;

    .prologue
    .line 250
    iget v0, p0, Lcom/greysonparrelli/permiso/Permiso;->mActiveRequestCode:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/greysonparrelli/permiso/Permiso;->mActiveRequestCode:I

    .line 251
    .local v0, "requestCode":I
    iget-object v1, p0, Lcom/greysonparrelli/permiso/Permiso;->mCodesToRequests:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    return v0
.end method


# virtual methods
.method public onRequestPermissionResult(I[Ljava/lang/String;[I)V
    .registers 7
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .prologue
    .line 156
    iget-object v1, p0, Lcom/greysonparrelli/permiso/Permiso;->mCodesToRequests:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 157
    iget-object v1, p0, Lcom/greysonparrelli/permiso/Permiso;->mCodesToRequests:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/greysonparrelli/permiso/Permiso$RequestData;

    .line 158
    .local v0, "requestData":Lcom/greysonparrelli/permiso/Permiso$RequestData;
    iget-object v1, v0, Lcom/greysonparrelli/permiso/Permiso$RequestData;->resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    # invokes: Lcom/greysonparrelli/permiso/Permiso$ResultSet;->parsePermissionResults([Ljava/lang/String;[I)V
    invoke-static {v1, p2, p3}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->access$300(Lcom/greysonparrelli/permiso/Permiso$ResultSet;[Ljava/lang/String;[I)V

    .line 159
    iget-object v1, v0, Lcom/greysonparrelli/permiso/Permiso$RequestData;->onResultListener:Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;

    iget-object v2, v0, Lcom/greysonparrelli/permiso/Permiso$RequestData;->resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    invoke-interface {v1, v2}, Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;->onPermissionResult(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)V

    .line 160
    iget-object v1, p0, Lcom/greysonparrelli/permiso/Permiso;->mCodesToRequests:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .end local v0    # "requestData":Lcom/greysonparrelli/permiso/Permiso$RequestData;
    :goto_2d
    return-void

    .line 162
    :cond_2e
    const-string v1, "Permiso"

    const-string v2, "onRequestPermissionResult() was given an unrecognized request code."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2d
.end method

.method public varargs requestPermissions(Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;[Ljava/lang/String;)V
    .registers 14
    .param p1, "callback"    # Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "permissions"    # [Ljava/lang/String;
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .prologue
    .line 99
    invoke-direct {p0}, Lcom/greysonparrelli/permiso/Permiso;->checkActivity()V

    .line 101
    new-instance v7, Lcom/greysonparrelli/permiso/Permiso$RequestData;

    invoke-direct {v7, p1, p2}, Lcom/greysonparrelli/permiso/Permiso$RequestData;-><init>(Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;[Ljava/lang/String;)V

    .line 104
    .local v7, "requestData":Lcom/greysonparrelli/permiso/Permiso$RequestData;
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_b
    if-ge v1, v2, :cond_2b

    aget-object v4, v0, v1

    .line 105
    .local v4, "permission":Ljava/lang/String;
    iget-object v8, p0, Lcom/greysonparrelli/permiso/Permiso;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v8}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/Context;

    invoke-static {v8, v4}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    if-nez v8, :cond_28

    .line 106
    iget-object v8, v7, Lcom/greysonparrelli/permiso/Permiso$RequestData;->resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    # invokes: Lcom/greysonparrelli/permiso/Permiso$ResultSet;->grantPermissions([Ljava/lang/String;)V
    invoke-static {v8, v9}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->access$000(Lcom/greysonparrelli/permiso/Permiso$ResultSet;[Ljava/lang/String;)V

    .line 104
    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 111
    .end local v4    # "permission":Ljava/lang/String;
    :cond_2b
    iget-object v8, v7, Lcom/greysonparrelli/permiso/Permiso$RequestData;->resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    invoke-virtual {v8}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->areAllPermissionsGranted()Z

    move-result v8

    if-eqz v8, :cond_3b

    .line 112
    iget-object v8, v7, Lcom/greysonparrelli/permiso/Permiso$RequestData;->onResultListener:Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;

    iget-object v9, v7, Lcom/greysonparrelli/permiso/Permiso$RequestData;->resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    invoke-interface {v8, v9}, Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;->onPermissionResult(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)V

    .line 140
    :cond_3a
    :goto_3a
    return-void

    .line 116
    :cond_3b
    invoke-direct {p0, v7}, Lcom/greysonparrelli/permiso/Permiso;->linkToExistingRequestIfPossible(Lcom/greysonparrelli/permiso/Permiso$RequestData;)Z

    move-result v3

    .line 120
    .local v3, "linkedToExisting":Z
    if-nez v3, :cond_3a

    .line 122
    invoke-direct {p0, v7}, Lcom/greysonparrelli/permiso/Permiso;->markRequestAsActive(Lcom/greysonparrelli/permiso/Permiso$RequestData;)I

    move-result v6

    .line 125
    .local v6, "requestCode":I
    iget-object v9, v7, Lcom/greysonparrelli/permiso/Permiso$RequestData;->resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    iget-object v8, p0, Lcom/greysonparrelli/permiso/Permiso;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v8}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/app/Activity;

    # invokes: Lcom/greysonparrelli/permiso/Permiso$ResultSet;->getPermissionsThatNeedRationale(Landroid/app/Activity;)[Ljava/lang/String;
    invoke-static {v9, v8}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->access$100(Lcom/greysonparrelli/permiso/Permiso$ResultSet;Landroid/app/Activity;)[Ljava/lang/String;

    move-result-object v5

    .line 128
    .local v5, "permissionsThatNeedRationale":[Ljava/lang/String;
    array-length v8, v5

    if-lez v8, :cond_61

    .line 129
    iget-object v8, v7, Lcom/greysonparrelli/permiso/Permiso$RequestData;->onResultListener:Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;

    new-instance v9, Lcom/greysonparrelli/permiso/Permiso$1;

    invoke-direct {v9, p0, v6}, Lcom/greysonparrelli/permiso/Permiso$1;-><init>(Lcom/greysonparrelli/permiso/Permiso;I)V

    invoke-interface {v8, v9, v5}, Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;->onRationaleRequested(Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;[Ljava/lang/String;)V

    goto :goto_3a

    .line 136
    :cond_61
    invoke-direct {p0, v6}, Lcom/greysonparrelli/permiso/Permiso;->makePermissionRequest(I)V

    goto :goto_3a
.end method

.method public setActivity(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 85
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/greysonparrelli/permiso/Permiso;->mActivity:Ljava/lang/ref/WeakReference;

    .line 86
    return-void
.end method

.method public showRationaleInDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;)V
    .registers 8
    .param p1, "title"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "message"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "buttonText"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "rationaleCallback"    # Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .prologue
    .line 181
    invoke-direct {p0}, Lcom/greysonparrelli/permiso/Permiso;->checkActivity()V

    .line 183
    invoke-static {p1, p2, p3}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->newInstance(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/greysonparrelli/permiso/PermisoDialogFragment;

    move-result-object v0

    .line 187
    .local v0, "dialogFragment":Lcom/greysonparrelli/permiso/PermisoDialogFragment;
    new-instance v1, Lcom/greysonparrelli/permiso/Permiso$2;

    invoke-direct {v1, p0, p4}, Lcom/greysonparrelli/permiso/Permiso$2;-><init>(Lcom/greysonparrelli/permiso/Permiso;Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;)V

    invoke-virtual {v0, v1}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->setOnCloseListener(Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;)V

    .line 193
    iget-object v1, p0, Lcom/greysonparrelli/permiso/Permiso;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    sget-object v2, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->TAG:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 194
    return-void
.end method
