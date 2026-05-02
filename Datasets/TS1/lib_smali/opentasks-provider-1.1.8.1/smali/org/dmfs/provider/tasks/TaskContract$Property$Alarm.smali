.class public interface abstract Lorg/dmfs/provider/tasks/TaskContract$Property$Alarm;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/provider/tasks/TaskContract$PropertyColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/provider/tasks/TaskContract$Property;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Alarm"
.end annotation


# static fields
.field public static final ALARM_REFERENCE_DUE_DATE:I = 0x1

.field public static final ALARM_REFERENCE_START_DATE:I = 0x2

.field public static final ALARM_TYPE:Ljava/lang/String; = "data3"

.field public static final ALARM_TYPE_EMAIL:I = 0x2

.field public static final ALARM_TYPE_MESSAGE:I = 0x1

.field public static final ALARM_TYPE_NOTHING:I = 0x0

.field public static final ALARM_TYPE_SMS:I = 0x3

.field public static final ALARM_TYPE_SOUND:I = 0x4

.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/alarm"

.field public static final MESSAGE:Ljava/lang/String; = "data2"

.field public static final MINUTES_BEFORE:Ljava/lang/String; = "data0"

.field public static final REFERENCE:Ljava/lang/String; = "data1"
