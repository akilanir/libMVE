.class public interface abstract Lorg/dmfs/provider/tasks/TaskContract$TaskColumns;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/provider/tasks/TaskContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "TaskColumns"
.end annotation


# static fields
.field public static final CLASSIFICATION:Ljava/lang/String; = "class"

.field public static final CLASSIFICATION_CONFIDENTIAL:I = 0x2

.field public static final CLASSIFICATION_DEFAULT:Ljava/lang/Integer;

.field public static final CLASSIFICATION_PRIVATE:I = 0x1

.field public static final CLASSIFICATION_PUBLIC:I = 0x0

.field public static final COMPLETED:Ljava/lang/String; = "completed"

.field public static final COMPLETED_IS_ALLDAY:Ljava/lang/String; = "completed_is_allday"

.field public static final CREATED:Ljava/lang/String; = "created"

.field public static final DESCRIPTION:Ljava/lang/String; = "description"

.field public static final DTSTART:Ljava/lang/String; = "dtstart"

.field public static final DUE:Ljava/lang/String; = "due"

.field public static final DURATION:Ljava/lang/String; = "duration"

.field public static final EXDATE:Ljava/lang/String; = "exdate"

.field public static final GEO:Ljava/lang/String; = "geo"

.field public static final HAS_ALARMS:Ljava/lang/String; = "has_alarms"

.field public static final HAS_PROPERTIES:Ljava/lang/String; = "has_properties"

.field public static final IS_ALLDAY:Ljava/lang/String; = "is_allday"

.field public static final IS_CLOSED:Ljava/lang/String; = "is_closed"

.field public static final IS_NEW:Ljava/lang/String; = "is_new"

.field public static final LAST_MODIFIED:Ljava/lang/String; = "last_modified"

.field public static final LIST_ID:Ljava/lang/String; = "list_id"

.field public static final LOCATION:Ljava/lang/String; = "location"

.field public static final ORGANIZER:Ljava/lang/String; = "organizer"

.field public static final ORIGINAL_INSTANCE_ALLDAY:Ljava/lang/String; = "original_instance_allday"

.field public static final ORIGINAL_INSTANCE_ID:Ljava/lang/String; = "original_instance_id"

.field public static final ORIGINAL_INSTANCE_SYNC_ID:Ljava/lang/String; = "original_instance_sync_id"

.field public static final ORIGINAL_INSTANCE_TIME:Ljava/lang/String; = "original_instance_time"

.field public static final PARENT_ID:Ljava/lang/String; = "parent_id"

.field public static final PERCENT_COMPLETE:Ljava/lang/String; = "percent_complete"

.field public static final PINNED:Ljava/lang/String; = "pinned"

.field public static final PRIORITY:Ljava/lang/String; = "priority"

.field public static final PRIORITY_DEFAULT:I = 0x0

.field public static final RDATE:Ljava/lang/String; = "rdate"

.field public static final RRULE:Ljava/lang/String; = "rrule"

.field public static final SORTING:Ljava/lang/String; = "sorting"

.field public static final STATUS:Ljava/lang/String; = "status"

.field public static final STATUS_CANCELLED:I = 0x3

.field public static final STATUS_COMPLETED:I = 0x2

.field public static final STATUS_DEFAULT:I = 0x0

.field public static final STATUS_IN_PROCESS:I = 0x1

.field public static final STATUS_NEEDS_ACTION:I = 0x0

.field public static final TASK_COLOR:Ljava/lang/String; = "task_color"

.field public static final TITLE:Ljava/lang/String; = "title"

.field public static final TZ:Ljava/lang/String; = "tz"

.field public static final URL:Ljava/lang/String; = "url"

.field public static final _ID:Ljava/lang/String; = "_id"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$TaskColumns;->CLASSIFICATION_DEFAULT:Ljava/lang/Integer;

    return-void
.end method
