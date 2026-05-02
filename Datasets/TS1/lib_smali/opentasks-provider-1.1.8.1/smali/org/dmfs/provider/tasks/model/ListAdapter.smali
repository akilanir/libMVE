.class public interface abstract Lorg/dmfs/provider/tasks/model/ListAdapter;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/provider/tasks/model/EntityAdapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/dmfs/provider/tasks/model/EntityAdapter",
        "<",
        "Lorg/dmfs/provider/tasks/model/ListAdapter;",
        ">;"
    }
.end annotation


# static fields
.field public static final ACCOUNT_NAME:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter",
            "<",
            "Lorg/dmfs/provider/tasks/model/ListAdapter;",
            ">;"
        }
    .end annotation
.end field

.field public static final ACCOUNT_TYPE:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter",
            "<",
            "Lorg/dmfs/provider/tasks/model/ListAdapter;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIST_COLOR:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter",
            "<",
            "Lorg/dmfs/provider/tasks/model/ListAdapter;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIST_NAME:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter",
            "<",
            "Lorg/dmfs/provider/tasks/model/ListAdapter;",
            ">;"
        }
    .end annotation
.end field

.field public static final OWNER:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter",
            "<",
            "Lorg/dmfs/provider/tasks/model/ListAdapter;",
            ">;"
        }
    .end annotation
.end field

.field public static final SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter",
            "<",
            "Lorg/dmfs/provider/tasks/model/ListAdapter;",
            ">;"
        }
    .end annotation
.end field

.field public static final SYNC_VERSION:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter",
            "<",
            "Lorg/dmfs/provider/tasks/model/ListAdapter;",
            ">;"
        }
    .end annotation
.end field

.field public static final _ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter",
            "<",
            "Lorg/dmfs/provider/tasks/model/ListAdapter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    const-string v1, "_id"

    invoke-direct {v0, v1}, Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    new-instance v0, Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    const-string v1, "_sync_id"

    invoke-direct {v0, v1}, Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    new-instance v0, Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    const-string v1, "sync_version"

    invoke-direct {v0, v1}, Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->SYNC_VERSION:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    new-instance v0, Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    const-string v1, "account_name"

    invoke-direct {v0, v1}, Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->ACCOUNT_NAME:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    new-instance v0, Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    const-string v1, "account_type"

    invoke-direct {v0, v1}, Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->ACCOUNT_TYPE:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    new-instance v0, Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    const-string v1, "list_owner"

    invoke-direct {v0, v1}, Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->OWNER:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    new-instance v0, Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    const-string v1, "list_name"

    invoke-direct {v0, v1}, Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->LIST_NAME:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    new-instance v0, Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    const-string v1, "list_color"

    invoke-direct {v0, v1}, Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->LIST_COLOR:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    return-void
.end method


# virtual methods
.method public abstract duplicate()Lorg/dmfs/provider/tasks/model/ListAdapter;
.end method
