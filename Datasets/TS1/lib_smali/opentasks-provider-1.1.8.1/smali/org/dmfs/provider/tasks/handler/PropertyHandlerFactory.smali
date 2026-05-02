.class public Lorg/dmfs/provider/tasks/handler/PropertyHandlerFactory;
.super Ljava/lang/Object;


# static fields
.field private static final ALARM_HANDLER:Lorg/dmfs/provider/tasks/handler/PropertyHandler;

.field private static final CATEGORY_HANDLER:Lorg/dmfs/provider/tasks/handler/PropertyHandler;

.field private static final DEFAULT_PROPERTY_HANDLER:Lorg/dmfs/provider/tasks/handler/PropertyHandler;

.field private static final RELATION_HANDLER:Lorg/dmfs/provider/tasks/handler/PropertyHandler;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lorg/dmfs/provider/tasks/handler/CategoryHandler;

    invoke-direct {v0}, Lorg/dmfs/provider/tasks/handler/CategoryHandler;-><init>()V

    sput-object v0, Lorg/dmfs/provider/tasks/handler/PropertyHandlerFactory;->CATEGORY_HANDLER:Lorg/dmfs/provider/tasks/handler/PropertyHandler;

    new-instance v0, Lorg/dmfs/provider/tasks/handler/AlarmHandler;

    invoke-direct {v0}, Lorg/dmfs/provider/tasks/handler/AlarmHandler;-><init>()V

    sput-object v0, Lorg/dmfs/provider/tasks/handler/PropertyHandlerFactory;->ALARM_HANDLER:Lorg/dmfs/provider/tasks/handler/PropertyHandler;

    new-instance v0, Lorg/dmfs/provider/tasks/handler/RelationHandler;

    invoke-direct {v0}, Lorg/dmfs/provider/tasks/handler/RelationHandler;-><init>()V

    sput-object v0, Lorg/dmfs/provider/tasks/handler/PropertyHandlerFactory;->RELATION_HANDLER:Lorg/dmfs/provider/tasks/handler/PropertyHandler;

    new-instance v0, Lorg/dmfs/provider/tasks/handler/DefaultPropertyHandler;

    invoke-direct {v0}, Lorg/dmfs/provider/tasks/handler/DefaultPropertyHandler;-><init>()V

    sput-object v0, Lorg/dmfs/provider/tasks/handler/PropertyHandlerFactory;->DEFAULT_PROPERTY_HANDLER:Lorg/dmfs/provider/tasks/handler/PropertyHandler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Ljava/lang/String;)Lorg/dmfs/provider/tasks/handler/PropertyHandler;
    .registers 2

    const-string v0, "vnd.android.cursor.item/category"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    sget-object v0, Lorg/dmfs/provider/tasks/handler/PropertyHandlerFactory;->CATEGORY_HANDLER:Lorg/dmfs/provider/tasks/handler/PropertyHandler;

    :goto_a
    return-object v0

    :cond_b
    const-string v0, "vnd.android.cursor.item/alarm"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    sget-object v0, Lorg/dmfs/provider/tasks/handler/PropertyHandlerFactory;->ALARM_HANDLER:Lorg/dmfs/provider/tasks/handler/PropertyHandler;

    goto :goto_a

    :cond_16
    const-string v0, "vnd.android.cursor.item/relation"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    sget-object v0, Lorg/dmfs/provider/tasks/handler/PropertyHandlerFactory;->RELATION_HANDLER:Lorg/dmfs/provider/tasks/handler/PropertyHandler;

    goto :goto_a

    :cond_21
    sget-object v0, Lorg/dmfs/provider/tasks/handler/PropertyHandlerFactory;->DEFAULT_PROPERTY_HANDLER:Lorg/dmfs/provider/tasks/handler/PropertyHandler;

    goto :goto_a
.end method
