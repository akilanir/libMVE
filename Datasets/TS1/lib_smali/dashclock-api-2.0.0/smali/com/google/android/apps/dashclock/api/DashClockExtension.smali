.class public abstract Lcom/google/android/apps/dashclock/api/DashClockExtension;
.super Landroid/app/Service;
.source "DashClockExtension.java"


# static fields
.field public static final ACTION_EXTENSION:Ljava/lang/String; = "com.google.android.apps.dashclock.Extension"

.field private static final DASHCLOCK_SIGNATURE:Landroid/content/pm/Signature;

.field public static final EXTRA_FROM_DASHCLOCK_SETTINGS:Ljava/lang/String; = "com.google.android.apps.dashclock.extra.FROM_DASHCLOCK_SETTINGS"

.field public static final PERMISSION_READ_EXTENSION_DATA:Ljava/lang/String; = "com.google.android.apps.dashclock.permission.READ_EXTENSION_DATA"

.field private static final PROTOCOL_VERSION_WORLD_READABILITY:I = 0x2

.field private static final TAG:Ljava/lang/String; = "DashClockExtension"

.field public static final UPDATE_REASON_CONTENT_CHANGED:I = 0x4

.field public static final UPDATE_REASON_INITIAL:I = 0x1

.field public static final UPDATE_REASON_MANUAL:I = 0x6

.field public static final UPDATE_REASON_PERIODIC:I = 0x2

.field public static final UPDATE_REASON_SCREEN_ON:I = 0x5

.field public static final UPDATE_REASON_SETTINGS_CHANGED:I = 0x3

.field public static final UPDATE_REASON_UNKNOWN:I


# instance fields
.field private mBinder:Lcom/google/android/apps/dashclock/api/internal/IExtension$Stub;

.field private mHost:Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;

.field private mInitialized:Z

.field private mIsWorldReadable:Z

.field private volatile mServiceHandler:Landroid/os/Handler;

.field private volatile mServiceLooper:Landroid/os/Looper;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 414
    new-instance v0, Landroid/content/pm/Signature;

    const-string v1, "308203523082023aa00302010202044c1132a9300d06092a864886f70d0101050500306b310b30090603550406130255533110300e06035504081307556e6b6e6f776e3110300e06035504071307556e6b6e6f776e3110300e060355040a1307556e6b6e6f776e3110300e060355040b1307556e6b6e6f776e311430120603550403130b526f6d616e204e7572696b301e170d3130303631303138343435375a170d3337313032363138343435375a306b310b30090603550406130255533110300e06035504081307556e6b6e6f776e3110300e06035504071307556e6b6e6f776e3110300e060355040a1307556e6b6e6f776e3110300e060355040b1307556e6b6e6f776e311430120603550403130b526f6d616e204e7572696b30820122300d06092a864886f70d01010105000382010f003082010a02820101008906222723a4b30dca6f0702b041e6f361e38e35105ec530bf43f4f1786737fefe6ccfa3b038a3700ea685dd185112a0a8f96327d3373de28e05859a87bde82372baed5618082121d6946e4affbdfb6771abb782147d58a2323518b34efcce144ec3e45fb2556eba1c40b42ccbcc1266c9469b5447edf09d5cf8e2ed62cfb3bd902e47f48a11a815a635c3879c882eae923c7f73bfba4039b7c19930617e3326fa163b924eda398bacc0d6ef8643a32223ce1d767734e866553ad50d11fb22ac3a15ba021a6a3904a95ed65f54142256cb0db90038dd55adfeeb18d3ffb085c4380817268f039119ecbdfca843e4b82209947fd88470b3d8c76fc15878fbc4f10203010001300d06092a864886f70d0101050500038201010047063efdd5011adb69cca6461a57443fef59243f85e5727ec0d67513bb04b650b1144fc1f54e09789c278171c52b9305a7265cafc13b89d91eb37ddce34a5c1f17c8c36f86c957c4e9cacc19e6822e0a5711f2cfba2c5913ba582ab69485548b13072bc736310b9da85a716d0418e6449450cedadfc1c897f93ed6189cfa0a02b893125bd4b1c4e4dd50c1ad33e221120b8488841763a3361817081e76911e76d3adcf94b23c758ceb955f9fdf8ef4a8351fc279867a25729f081b511209e96dfa8520225b810072de5e8eefc1a6cc22f46857e2cc4fd1a1eaac76054f34352b63c9d53691515b42cc771f195343e61397cb7b04ada2a627410d29c214976d13"

    invoke-direct {v0, v1}, Landroid/content/pm/Signature;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->DASHCLOCK_SIGNATURE:Landroid/content/pm/Signature;

    return-void
.end method

.method protected constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 219
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 211
    iput-boolean v0, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mInitialized:Z

    .line 212
    iput-boolean v0, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mIsWorldReadable:Z

    .line 263
    new-instance v0, Lcom/google/android/apps/dashclock/api/DashClockExtension$1;

    invoke-direct {v0, p0}, Lcom/google/android/apps/dashclock/api/DashClockExtension$1;-><init>(Lcom/google/android/apps/dashclock/api/DashClockExtension;)V

    iput-object v0, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mBinder:Lcom/google/android/apps/dashclock/api/internal/IExtension$Stub;

    .line 220
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/apps/dashclock/api/DashClockExtension;)Z
    .registers 2
    .param p0, "x0"    # Lcom/google/android/apps/dashclock/api/DashClockExtension;

    .prologue
    .line 131
    iget-boolean v0, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mIsWorldReadable:Z

    return v0
.end method

.method static synthetic access$100()Landroid/content/pm/Signature;
    .registers 1

    .prologue
    .line 131
    sget-object v0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->DASHCLOCK_SIGNATURE:Landroid/content/pm/Signature;

    return-object v0
.end method

.method static synthetic access$202(Lcom/google/android/apps/dashclock/api/DashClockExtension;Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;)Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/apps/dashclock/api/DashClockExtension;
    .param p1, "x1"    # Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;

    .prologue
    .line 131
    iput-object p1, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mHost:Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;

    return-object p1
.end method

.method static synthetic access$300(Lcom/google/android/apps/dashclock/api/DashClockExtension;)Z
    .registers 2
    .param p0, "x0"    # Lcom/google/android/apps/dashclock/api/DashClockExtension;

    .prologue
    .line 131
    iget-boolean v0, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mInitialized:Z

    return v0
.end method

.method static synthetic access$302(Lcom/google/android/apps/dashclock/api/DashClockExtension;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/google/android/apps/dashclock/api/DashClockExtension;
    .param p1, "x1"    # Z

    .prologue
    .line 131
    iput-boolean p1, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mInitialized:Z

    return p1
.end method

.method static synthetic access$400(Lcom/google/android/apps/dashclock/api/DashClockExtension;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/apps/dashclock/api/DashClockExtension;

    .prologue
    .line 131
    iget-object v0, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mServiceHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private loadMetaData()V
    .registers 8

    .prologue
    .line 242
    invoke-virtual {p0}, Lcom/google/android/apps/dashclock/api/DashClockExtension;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 244
    .local v2, "pm":Landroid/content/pm/PackageManager;
    :try_start_4
    new-instance v5, Landroid/content/ComponentName;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-direct {v5, p0, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v6, 0x80

    invoke-virtual {v2, v5, v6}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    move-result-object v4

    .line 247
    .local v4, "si":Landroid/content/pm/ServiceInfo;
    iget-object v1, v4, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    .line 248
    .local v1, "metaData":Landroid/os/Bundle;
    if-eqz v1, :cond_2b

    .line 249
    const-string v5, "protocolVersion"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 250
    .local v3, "protocolVersion":I
    const/4 v5, 0x2

    if-lt v3, v5, :cond_2c

    const-string v5, "worldReadable"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2c

    const/4 v5, 0x1

    :goto_29
    iput-boolean v5, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mIsWorldReadable:Z
    :try_end_2b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_2b} :catch_2e

    .line 256
    .end local v1    # "metaData":Landroid/os/Bundle;
    .end local v3    # "protocolVersion":I
    .end local v4    # "si":Landroid/content/pm/ServiceInfo;
    :cond_2b
    :goto_2b
    return-void

    .line 250
    .restart local v1    # "metaData":Landroid/os/Bundle;
    .restart local v3    # "protocolVersion":I
    .restart local v4    # "si":Landroid/content/pm/ServiceInfo;
    :cond_2c
    const/4 v5, 0x0

    goto :goto_29

    .line 253
    .end local v1    # "metaData":Landroid/os/Bundle;
    .end local v3    # "protocolVersion":I
    .end local v4    # "si":Landroid/content/pm/ServiceInfo;
    :catch_2e
    move-exception v0

    .line 254
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v5, "DashClockExtension"

    const-string v6, "Could not load metadata (e.g. world readable) for extension."

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2b
.end method


# virtual methods
.method protected final addWatchContentUris([Ljava/lang/String;)V
    .registers 5
    .param p1, "uris"    # [Ljava/lang/String;

    .prologue
    .line 371
    :try_start_0
    iget-object v1, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mHost:Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;

    invoke-interface {v1, p1}, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;->addWatchContentUris([Ljava/lang/String;)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_5} :catch_6

    .line 375
    :goto_5
    return-void

    .line 372
    :catch_6
    move-exception v0

    .line 373
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "DashClockExtension"

    const-string v2, "Couldn\'t watch content URIs."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5
.end method

.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 260
    iget-object v0, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mBinder:Lcom/google/android/apps/dashclock/api/internal/IExtension$Stub;

    return-object v0
.end method

.method public onCreate()V
    .registers 4

    .prologue
    .line 224
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 225
    invoke-direct {p0}, Lcom/google/android/apps/dashclock/api/DashClockExtension;->loadMetaData()V

    .line 227
    new-instance v0, Landroid/os/HandlerThread;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DashClockExtension:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 229
    .local v0, "thread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 231
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mServiceLooper:Landroid/os/Looper;

    .line 232
    new-instance v1, Landroid/os/Handler;

    iget-object v2, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mServiceLooper:Landroid/os/Looper;

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mServiceHandler:Landroid/os/Handler;

    .line 233
    return-void
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 237
    iget-object v0, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mServiceHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 238
    iget-object v0, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mServiceLooper:Landroid/os/Looper;

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 239
    return-void
.end method

.method protected onInitialize(Z)V
    .registers 2
    .param p1, "isReconnect"    # Z

    .prologue
    .line 328
    return-void
.end method

.method protected abstract onUpdateData(I)V
.end method

.method protected final publishUpdate(Lcom/google/android/apps/dashclock/api/ExtensionData;)V
    .registers 5
    .param p1, "data"    # Lcom/google/android/apps/dashclock/api/ExtensionData;

    .prologue
    .line 354
    :try_start_0
    iget-object v1, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mHost:Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;

    invoke-interface {v1, p1}, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;->publishUpdate(Lcom/google/android/apps/dashclock/api/ExtensionData;)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_5} :catch_6

    .line 358
    :goto_5
    return-void

    .line 355
    :catch_6
    move-exception v0

    .line 356
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "DashClockExtension"

    const-string v2, "Couldn\'t publish updated extension data."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5
.end method

.method protected final removeAllWatchContentUris()V
    .registers 4

    .prologue
    .line 386
    :try_start_0
    iget-object v1, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mHost:Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;

    invoke-interface {v1}, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;->removeAllWatchContentUris()V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_5} :catch_6

    .line 390
    :goto_5
    return-void

    .line 387
    :catch_6
    move-exception v0

    .line 388
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "DashClockExtension"

    const-string v2, "Couldn\'t stop watching content URIs."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5
.end method

.method protected final setUpdateWhenScreenOn(Z)V
    .registers 5
    .param p1, "updateWhenScreenOn"    # Z

    .prologue
    .line 404
    :try_start_0
    iget-object v1, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension;->mHost:Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;

    invoke-interface {v1, p1}, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;->setUpdateWhenScreenOn(Z)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_5} :catch_6

    .line 408
    :goto_5
    return-void

    .line 405
    :catch_6
    move-exception v0

    .line 406
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "DashClockExtension"

    const-string v2, "Couldn\'t set the extension to update upon ACTION_SCREEN_ON."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5
.end method
