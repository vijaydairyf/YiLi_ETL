// ORM class for table 'W_SL_REQUEST_TYPE_D_1'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Thu Jul 11 11:25:56 CST 2019
// For connector: org.apache.sqoop.manager.OracleManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class W_SL_REQUEST_TYPE_D_1 extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("LOOKUP_CODE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        LOOKUP_CODE = (String)value;
      }
    });
    setters.put("MEANING", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        MEANING = (String)value;
      }
    });
    setters.put("DESCRIPTION", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DESCRIPTION = (String)value;
      }
    });
    setters.put("ENABLED_FLAG", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ENABLED_FLAG = (String)value;
      }
    });
    setters.put("START_DATE_ACTIVE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        START_DATE_ACTIVE = (java.sql.Timestamp)value;
      }
    });
    setters.put("END_DATE_ACTIVE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        END_DATE_ACTIVE = (java.sql.Timestamp)value;
      }
    });
    setters.put("LAST_UPDATE_DATE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        LAST_UPDATE_DATE = (java.sql.Timestamp)value;
      }
    });
    setters.put("W_INSERT_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        W_INSERT_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("INTEGRATION_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        INTEGRATION_ID = (String)value;
      }
    });
    setters.put("ROW_WID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ROW_WID = (java.math.BigDecimal)value;
      }
    });
    setters.put("VERSION", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        VERSION = (java.math.BigDecimal)value;
      }
    });
    setters.put("DATE_FROM", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DATE_FROM = (java.sql.Timestamp)value;
      }
    });
    setters.put("DATE_TO", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DATE_TO = (java.sql.Timestamp)value;
      }
    });
    setters.put("LONGITUDE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        LONGITUDE = (java.math.BigDecimal)value;
      }
    });
    setters.put("LATITUDE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        LATITUDE = (java.math.BigDecimal)value;
      }
    });
  }
  public W_SL_REQUEST_TYPE_D_1() {
    init0();
  }
  private String LOOKUP_CODE;
  public String get_LOOKUP_CODE() {
    return LOOKUP_CODE;
  }
  public void set_LOOKUP_CODE(String LOOKUP_CODE) {
    this.LOOKUP_CODE = LOOKUP_CODE;
  }
  public W_SL_REQUEST_TYPE_D_1 with_LOOKUP_CODE(String LOOKUP_CODE) {
    this.LOOKUP_CODE = LOOKUP_CODE;
    return this;
  }
  private String MEANING;
  public String get_MEANING() {
    return MEANING;
  }
  public void set_MEANING(String MEANING) {
    this.MEANING = MEANING;
  }
  public W_SL_REQUEST_TYPE_D_1 with_MEANING(String MEANING) {
    this.MEANING = MEANING;
    return this;
  }
  private String DESCRIPTION;
  public String get_DESCRIPTION() {
    return DESCRIPTION;
  }
  public void set_DESCRIPTION(String DESCRIPTION) {
    this.DESCRIPTION = DESCRIPTION;
  }
  public W_SL_REQUEST_TYPE_D_1 with_DESCRIPTION(String DESCRIPTION) {
    this.DESCRIPTION = DESCRIPTION;
    return this;
  }
  private String ENABLED_FLAG;
  public String get_ENABLED_FLAG() {
    return ENABLED_FLAG;
  }
  public void set_ENABLED_FLAG(String ENABLED_FLAG) {
    this.ENABLED_FLAG = ENABLED_FLAG;
  }
  public W_SL_REQUEST_TYPE_D_1 with_ENABLED_FLAG(String ENABLED_FLAG) {
    this.ENABLED_FLAG = ENABLED_FLAG;
    return this;
  }
  private java.sql.Timestamp START_DATE_ACTIVE;
  public java.sql.Timestamp get_START_DATE_ACTIVE() {
    return START_DATE_ACTIVE;
  }
  public void set_START_DATE_ACTIVE(java.sql.Timestamp START_DATE_ACTIVE) {
    this.START_DATE_ACTIVE = START_DATE_ACTIVE;
  }
  public W_SL_REQUEST_TYPE_D_1 with_START_DATE_ACTIVE(java.sql.Timestamp START_DATE_ACTIVE) {
    this.START_DATE_ACTIVE = START_DATE_ACTIVE;
    return this;
  }
  private java.sql.Timestamp END_DATE_ACTIVE;
  public java.sql.Timestamp get_END_DATE_ACTIVE() {
    return END_DATE_ACTIVE;
  }
  public void set_END_DATE_ACTIVE(java.sql.Timestamp END_DATE_ACTIVE) {
    this.END_DATE_ACTIVE = END_DATE_ACTIVE;
  }
  public W_SL_REQUEST_TYPE_D_1 with_END_DATE_ACTIVE(java.sql.Timestamp END_DATE_ACTIVE) {
    this.END_DATE_ACTIVE = END_DATE_ACTIVE;
    return this;
  }
  private java.sql.Timestamp LAST_UPDATE_DATE;
  public java.sql.Timestamp get_LAST_UPDATE_DATE() {
    return LAST_UPDATE_DATE;
  }
  public void set_LAST_UPDATE_DATE(java.sql.Timestamp LAST_UPDATE_DATE) {
    this.LAST_UPDATE_DATE = LAST_UPDATE_DATE;
  }
  public W_SL_REQUEST_TYPE_D_1 with_LAST_UPDATE_DATE(java.sql.Timestamp LAST_UPDATE_DATE) {
    this.LAST_UPDATE_DATE = LAST_UPDATE_DATE;
    return this;
  }
  private java.sql.Timestamp W_INSERT_DT;
  public java.sql.Timestamp get_W_INSERT_DT() {
    return W_INSERT_DT;
  }
  public void set_W_INSERT_DT(java.sql.Timestamp W_INSERT_DT) {
    this.W_INSERT_DT = W_INSERT_DT;
  }
  public W_SL_REQUEST_TYPE_D_1 with_W_INSERT_DT(java.sql.Timestamp W_INSERT_DT) {
    this.W_INSERT_DT = W_INSERT_DT;
    return this;
  }
  private String INTEGRATION_ID;
  public String get_INTEGRATION_ID() {
    return INTEGRATION_ID;
  }
  public void set_INTEGRATION_ID(String INTEGRATION_ID) {
    this.INTEGRATION_ID = INTEGRATION_ID;
  }
  public W_SL_REQUEST_TYPE_D_1 with_INTEGRATION_ID(String INTEGRATION_ID) {
    this.INTEGRATION_ID = INTEGRATION_ID;
    return this;
  }
  private java.math.BigDecimal ROW_WID;
  public java.math.BigDecimal get_ROW_WID() {
    return ROW_WID;
  }
  public void set_ROW_WID(java.math.BigDecimal ROW_WID) {
    this.ROW_WID = ROW_WID;
  }
  public W_SL_REQUEST_TYPE_D_1 with_ROW_WID(java.math.BigDecimal ROW_WID) {
    this.ROW_WID = ROW_WID;
    return this;
  }
  private java.math.BigDecimal VERSION;
  public java.math.BigDecimal get_VERSION() {
    return VERSION;
  }
  public void set_VERSION(java.math.BigDecimal VERSION) {
    this.VERSION = VERSION;
  }
  public W_SL_REQUEST_TYPE_D_1 with_VERSION(java.math.BigDecimal VERSION) {
    this.VERSION = VERSION;
    return this;
  }
  private java.sql.Timestamp DATE_FROM;
  public java.sql.Timestamp get_DATE_FROM() {
    return DATE_FROM;
  }
  public void set_DATE_FROM(java.sql.Timestamp DATE_FROM) {
    this.DATE_FROM = DATE_FROM;
  }
  public W_SL_REQUEST_TYPE_D_1 with_DATE_FROM(java.sql.Timestamp DATE_FROM) {
    this.DATE_FROM = DATE_FROM;
    return this;
  }
  private java.sql.Timestamp DATE_TO;
  public java.sql.Timestamp get_DATE_TO() {
    return DATE_TO;
  }
  public void set_DATE_TO(java.sql.Timestamp DATE_TO) {
    this.DATE_TO = DATE_TO;
  }
  public W_SL_REQUEST_TYPE_D_1 with_DATE_TO(java.sql.Timestamp DATE_TO) {
    this.DATE_TO = DATE_TO;
    return this;
  }
  private java.math.BigDecimal LONGITUDE;
  public java.math.BigDecimal get_LONGITUDE() {
    return LONGITUDE;
  }
  public void set_LONGITUDE(java.math.BigDecimal LONGITUDE) {
    this.LONGITUDE = LONGITUDE;
  }
  public W_SL_REQUEST_TYPE_D_1 with_LONGITUDE(java.math.BigDecimal LONGITUDE) {
    this.LONGITUDE = LONGITUDE;
    return this;
  }
  private java.math.BigDecimal LATITUDE;
  public java.math.BigDecimal get_LATITUDE() {
    return LATITUDE;
  }
  public void set_LATITUDE(java.math.BigDecimal LATITUDE) {
    this.LATITUDE = LATITUDE;
  }
  public W_SL_REQUEST_TYPE_D_1 with_LATITUDE(java.math.BigDecimal LATITUDE) {
    this.LATITUDE = LATITUDE;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof W_SL_REQUEST_TYPE_D_1)) {
      return false;
    }
    W_SL_REQUEST_TYPE_D_1 that = (W_SL_REQUEST_TYPE_D_1) o;
    boolean equal = true;
    equal = equal && (this.LOOKUP_CODE == null ? that.LOOKUP_CODE == null : this.LOOKUP_CODE.equals(that.LOOKUP_CODE));
    equal = equal && (this.MEANING == null ? that.MEANING == null : this.MEANING.equals(that.MEANING));
    equal = equal && (this.DESCRIPTION == null ? that.DESCRIPTION == null : this.DESCRIPTION.equals(that.DESCRIPTION));
    equal = equal && (this.ENABLED_FLAG == null ? that.ENABLED_FLAG == null : this.ENABLED_FLAG.equals(that.ENABLED_FLAG));
    equal = equal && (this.START_DATE_ACTIVE == null ? that.START_DATE_ACTIVE == null : this.START_DATE_ACTIVE.equals(that.START_DATE_ACTIVE));
    equal = equal && (this.END_DATE_ACTIVE == null ? that.END_DATE_ACTIVE == null : this.END_DATE_ACTIVE.equals(that.END_DATE_ACTIVE));
    equal = equal && (this.LAST_UPDATE_DATE == null ? that.LAST_UPDATE_DATE == null : this.LAST_UPDATE_DATE.equals(that.LAST_UPDATE_DATE));
    equal = equal && (this.W_INSERT_DT == null ? that.W_INSERT_DT == null : this.W_INSERT_DT.equals(that.W_INSERT_DT));
    equal = equal && (this.INTEGRATION_ID == null ? that.INTEGRATION_ID == null : this.INTEGRATION_ID.equals(that.INTEGRATION_ID));
    equal = equal && (this.ROW_WID == null ? that.ROW_WID == null : this.ROW_WID.equals(that.ROW_WID));
    equal = equal && (this.VERSION == null ? that.VERSION == null : this.VERSION.equals(that.VERSION));
    equal = equal && (this.DATE_FROM == null ? that.DATE_FROM == null : this.DATE_FROM.equals(that.DATE_FROM));
    equal = equal && (this.DATE_TO == null ? that.DATE_TO == null : this.DATE_TO.equals(that.DATE_TO));
    equal = equal && (this.LONGITUDE == null ? that.LONGITUDE == null : this.LONGITUDE.equals(that.LONGITUDE));
    equal = equal && (this.LATITUDE == null ? that.LATITUDE == null : this.LATITUDE.equals(that.LATITUDE));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof W_SL_REQUEST_TYPE_D_1)) {
      return false;
    }
    W_SL_REQUEST_TYPE_D_1 that = (W_SL_REQUEST_TYPE_D_1) o;
    boolean equal = true;
    equal = equal && (this.LOOKUP_CODE == null ? that.LOOKUP_CODE == null : this.LOOKUP_CODE.equals(that.LOOKUP_CODE));
    equal = equal && (this.MEANING == null ? that.MEANING == null : this.MEANING.equals(that.MEANING));
    equal = equal && (this.DESCRIPTION == null ? that.DESCRIPTION == null : this.DESCRIPTION.equals(that.DESCRIPTION));
    equal = equal && (this.ENABLED_FLAG == null ? that.ENABLED_FLAG == null : this.ENABLED_FLAG.equals(that.ENABLED_FLAG));
    equal = equal && (this.START_DATE_ACTIVE == null ? that.START_DATE_ACTIVE == null : this.START_DATE_ACTIVE.equals(that.START_DATE_ACTIVE));
    equal = equal && (this.END_DATE_ACTIVE == null ? that.END_DATE_ACTIVE == null : this.END_DATE_ACTIVE.equals(that.END_DATE_ACTIVE));
    equal = equal && (this.LAST_UPDATE_DATE == null ? that.LAST_UPDATE_DATE == null : this.LAST_UPDATE_DATE.equals(that.LAST_UPDATE_DATE));
    equal = equal && (this.W_INSERT_DT == null ? that.W_INSERT_DT == null : this.W_INSERT_DT.equals(that.W_INSERT_DT));
    equal = equal && (this.INTEGRATION_ID == null ? that.INTEGRATION_ID == null : this.INTEGRATION_ID.equals(that.INTEGRATION_ID));
    equal = equal && (this.ROW_WID == null ? that.ROW_WID == null : this.ROW_WID.equals(that.ROW_WID));
    equal = equal && (this.VERSION == null ? that.VERSION == null : this.VERSION.equals(that.VERSION));
    equal = equal && (this.DATE_FROM == null ? that.DATE_FROM == null : this.DATE_FROM.equals(that.DATE_FROM));
    equal = equal && (this.DATE_TO == null ? that.DATE_TO == null : this.DATE_TO.equals(that.DATE_TO));
    equal = equal && (this.LONGITUDE == null ? that.LONGITUDE == null : this.LONGITUDE.equals(that.LONGITUDE));
    equal = equal && (this.LATITUDE == null ? that.LATITUDE == null : this.LATITUDE.equals(that.LATITUDE));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.LOOKUP_CODE = JdbcWritableBridge.readString(1, __dbResults);
    this.MEANING = JdbcWritableBridge.readString(2, __dbResults);
    this.DESCRIPTION = JdbcWritableBridge.readString(3, __dbResults);
    this.ENABLED_FLAG = JdbcWritableBridge.readString(4, __dbResults);
    this.START_DATE_ACTIVE = JdbcWritableBridge.readTimestamp(5, __dbResults);
    this.END_DATE_ACTIVE = JdbcWritableBridge.readTimestamp(6, __dbResults);
    this.LAST_UPDATE_DATE = JdbcWritableBridge.readTimestamp(7, __dbResults);
    this.W_INSERT_DT = JdbcWritableBridge.readTimestamp(8, __dbResults);
    this.INTEGRATION_ID = JdbcWritableBridge.readString(9, __dbResults);
    this.ROW_WID = JdbcWritableBridge.readBigDecimal(10, __dbResults);
    this.VERSION = JdbcWritableBridge.readBigDecimal(11, __dbResults);
    this.DATE_FROM = JdbcWritableBridge.readTimestamp(12, __dbResults);
    this.DATE_TO = JdbcWritableBridge.readTimestamp(13, __dbResults);
    this.LONGITUDE = JdbcWritableBridge.readBigDecimal(14, __dbResults);
    this.LATITUDE = JdbcWritableBridge.readBigDecimal(15, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.LOOKUP_CODE = JdbcWritableBridge.readString(1, __dbResults);
    this.MEANING = JdbcWritableBridge.readString(2, __dbResults);
    this.DESCRIPTION = JdbcWritableBridge.readString(3, __dbResults);
    this.ENABLED_FLAG = JdbcWritableBridge.readString(4, __dbResults);
    this.START_DATE_ACTIVE = JdbcWritableBridge.readTimestamp(5, __dbResults);
    this.END_DATE_ACTIVE = JdbcWritableBridge.readTimestamp(6, __dbResults);
    this.LAST_UPDATE_DATE = JdbcWritableBridge.readTimestamp(7, __dbResults);
    this.W_INSERT_DT = JdbcWritableBridge.readTimestamp(8, __dbResults);
    this.INTEGRATION_ID = JdbcWritableBridge.readString(9, __dbResults);
    this.ROW_WID = JdbcWritableBridge.readBigDecimal(10, __dbResults);
    this.VERSION = JdbcWritableBridge.readBigDecimal(11, __dbResults);
    this.DATE_FROM = JdbcWritableBridge.readTimestamp(12, __dbResults);
    this.DATE_TO = JdbcWritableBridge.readTimestamp(13, __dbResults);
    this.LONGITUDE = JdbcWritableBridge.readBigDecimal(14, __dbResults);
    this.LATITUDE = JdbcWritableBridge.readBigDecimal(15, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(LOOKUP_CODE, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MEANING, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DESCRIPTION, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ENABLED_FLAG, 4 + __off, 1, __dbStmt);
    JdbcWritableBridge.writeTimestamp(START_DATE_ACTIVE, 5 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(END_DATE_ACTIVE, 6 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(LAST_UPDATE_DATE, 7 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_INSERT_DT, 8 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(INTEGRATION_ID, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(ROW_WID, 10 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(VERSION, 11 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(DATE_FROM, 12 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(DATE_TO, 13 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(LONGITUDE, 14 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(LATITUDE, 15 + __off, 2, __dbStmt);
    return 15;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(LOOKUP_CODE, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MEANING, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DESCRIPTION, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ENABLED_FLAG, 4 + __off, 1, __dbStmt);
    JdbcWritableBridge.writeTimestamp(START_DATE_ACTIVE, 5 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(END_DATE_ACTIVE, 6 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(LAST_UPDATE_DATE, 7 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_INSERT_DT, 8 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(INTEGRATION_ID, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(ROW_WID, 10 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(VERSION, 11 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(DATE_FROM, 12 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(DATE_TO, 13 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(LONGITUDE, 14 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(LATITUDE, 15 + __off, 2, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.LOOKUP_CODE = null;
    } else {
    this.LOOKUP_CODE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MEANING = null;
    } else {
    this.MEANING = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DESCRIPTION = null;
    } else {
    this.DESCRIPTION = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ENABLED_FLAG = null;
    } else {
    this.ENABLED_FLAG = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.START_DATE_ACTIVE = null;
    } else {
    this.START_DATE_ACTIVE = new Timestamp(__dataIn.readLong());
    this.START_DATE_ACTIVE.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.END_DATE_ACTIVE = null;
    } else {
    this.END_DATE_ACTIVE = new Timestamp(__dataIn.readLong());
    this.END_DATE_ACTIVE.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.LAST_UPDATE_DATE = null;
    } else {
    this.LAST_UPDATE_DATE = new Timestamp(__dataIn.readLong());
    this.LAST_UPDATE_DATE.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.W_INSERT_DT = null;
    } else {
    this.W_INSERT_DT = new Timestamp(__dataIn.readLong());
    this.W_INSERT_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.INTEGRATION_ID = null;
    } else {
    this.INTEGRATION_ID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ROW_WID = null;
    } else {
    this.ROW_WID = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.VERSION = null;
    } else {
    this.VERSION = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DATE_FROM = null;
    } else {
    this.DATE_FROM = new Timestamp(__dataIn.readLong());
    this.DATE_FROM.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.DATE_TO = null;
    } else {
    this.DATE_TO = new Timestamp(__dataIn.readLong());
    this.DATE_TO.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.LONGITUDE = null;
    } else {
    this.LONGITUDE = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.LATITUDE = null;
    } else {
    this.LATITUDE = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.LOOKUP_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, LOOKUP_CODE);
    }
    if (null == this.MEANING) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MEANING);
    }
    if (null == this.DESCRIPTION) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DESCRIPTION);
    }
    if (null == this.ENABLED_FLAG) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ENABLED_FLAG);
    }
    if (null == this.START_DATE_ACTIVE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.START_DATE_ACTIVE.getTime());
    __dataOut.writeInt(this.START_DATE_ACTIVE.getNanos());
    }
    if (null == this.END_DATE_ACTIVE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.END_DATE_ACTIVE.getTime());
    __dataOut.writeInt(this.END_DATE_ACTIVE.getNanos());
    }
    if (null == this.LAST_UPDATE_DATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.LAST_UPDATE_DATE.getTime());
    __dataOut.writeInt(this.LAST_UPDATE_DATE.getNanos());
    }
    if (null == this.W_INSERT_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.W_INSERT_DT.getTime());
    __dataOut.writeInt(this.W_INSERT_DT.getNanos());
    }
    if (null == this.INTEGRATION_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, INTEGRATION_ID);
    }
    if (null == this.ROW_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.ROW_WID, __dataOut);
    }
    if (null == this.VERSION) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.VERSION, __dataOut);
    }
    if (null == this.DATE_FROM) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.DATE_FROM.getTime());
    __dataOut.writeInt(this.DATE_FROM.getNanos());
    }
    if (null == this.DATE_TO) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.DATE_TO.getTime());
    __dataOut.writeInt(this.DATE_TO.getNanos());
    }
    if (null == this.LONGITUDE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.LONGITUDE, __dataOut);
    }
    if (null == this.LATITUDE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.LATITUDE, __dataOut);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.LOOKUP_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, LOOKUP_CODE);
    }
    if (null == this.MEANING) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MEANING);
    }
    if (null == this.DESCRIPTION) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DESCRIPTION);
    }
    if (null == this.ENABLED_FLAG) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ENABLED_FLAG);
    }
    if (null == this.START_DATE_ACTIVE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.START_DATE_ACTIVE.getTime());
    __dataOut.writeInt(this.START_DATE_ACTIVE.getNanos());
    }
    if (null == this.END_DATE_ACTIVE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.END_DATE_ACTIVE.getTime());
    __dataOut.writeInt(this.END_DATE_ACTIVE.getNanos());
    }
    if (null == this.LAST_UPDATE_DATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.LAST_UPDATE_DATE.getTime());
    __dataOut.writeInt(this.LAST_UPDATE_DATE.getNanos());
    }
    if (null == this.W_INSERT_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.W_INSERT_DT.getTime());
    __dataOut.writeInt(this.W_INSERT_DT.getNanos());
    }
    if (null == this.INTEGRATION_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, INTEGRATION_ID);
    }
    if (null == this.ROW_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.ROW_WID, __dataOut);
    }
    if (null == this.VERSION) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.VERSION, __dataOut);
    }
    if (null == this.DATE_FROM) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.DATE_FROM.getTime());
    __dataOut.writeInt(this.DATE_FROM.getNanos());
    }
    if (null == this.DATE_TO) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.DATE_TO.getTime());
    __dataOut.writeInt(this.DATE_TO.getNanos());
    }
    if (null == this.LONGITUDE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.LONGITUDE, __dataOut);
    }
    if (null == this.LATITUDE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.LATITUDE, __dataOut);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(LOOKUP_CODE==null?"null":LOOKUP_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MEANING==null?"null":MEANING, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DESCRIPTION==null?"null":DESCRIPTION, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ENABLED_FLAG==null?"null":ENABLED_FLAG, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(START_DATE_ACTIVE==null?"null":"" + START_DATE_ACTIVE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(END_DATE_ACTIVE==null?"null":"" + END_DATE_ACTIVE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LAST_UPDATE_DATE==null?"null":"" + LAST_UPDATE_DATE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_INSERT_DT==null?"null":"" + W_INSERT_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(INTEGRATION_ID==null?"null":INTEGRATION_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ROW_WID==null?"null":ROW_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(VERSION==null?"null":VERSION.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATE_FROM==null?"null":"" + DATE_FROM, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATE_TO==null?"null":"" + DATE_TO, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LONGITUDE==null?"null":LONGITUDE.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LATITUDE==null?"null":LATITUDE.toPlainString(), delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(LOOKUP_CODE==null?"null":LOOKUP_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MEANING==null?"null":MEANING, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DESCRIPTION==null?"null":DESCRIPTION, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ENABLED_FLAG==null?"null":ENABLED_FLAG, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(START_DATE_ACTIVE==null?"null":"" + START_DATE_ACTIVE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(END_DATE_ACTIVE==null?"null":"" + END_DATE_ACTIVE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LAST_UPDATE_DATE==null?"null":"" + LAST_UPDATE_DATE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_INSERT_DT==null?"null":"" + W_INSERT_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(INTEGRATION_ID==null?"null":INTEGRATION_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ROW_WID==null?"null":ROW_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(VERSION==null?"null":VERSION.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATE_FROM==null?"null":"" + DATE_FROM, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATE_TO==null?"null":"" + DATE_TO, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LONGITUDE==null?"null":LONGITUDE.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LATITUDE==null?"null":LATITUDE.toPlainString(), delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.LOOKUP_CODE = null; } else {
      this.LOOKUP_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MEANING = null; } else {
      this.MEANING = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DESCRIPTION = null; } else {
      this.DESCRIPTION = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ENABLED_FLAG = null; } else {
      this.ENABLED_FLAG = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.START_DATE_ACTIVE = null; } else {
      this.START_DATE_ACTIVE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.END_DATE_ACTIVE = null; } else {
      this.END_DATE_ACTIVE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LAST_UPDATE_DATE = null; } else {
      this.LAST_UPDATE_DATE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.W_INSERT_DT = null; } else {
      this.W_INSERT_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.INTEGRATION_ID = null; } else {
      this.INTEGRATION_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ROW_WID = null; } else {
      this.ROW_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.VERSION = null; } else {
      this.VERSION = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.DATE_FROM = null; } else {
      this.DATE_FROM = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.DATE_TO = null; } else {
      this.DATE_TO = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LONGITUDE = null; } else {
      this.LONGITUDE = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LATITUDE = null; } else {
      this.LATITUDE = new java.math.BigDecimal(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.LOOKUP_CODE = null; } else {
      this.LOOKUP_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MEANING = null; } else {
      this.MEANING = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DESCRIPTION = null; } else {
      this.DESCRIPTION = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ENABLED_FLAG = null; } else {
      this.ENABLED_FLAG = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.START_DATE_ACTIVE = null; } else {
      this.START_DATE_ACTIVE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.END_DATE_ACTIVE = null; } else {
      this.END_DATE_ACTIVE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LAST_UPDATE_DATE = null; } else {
      this.LAST_UPDATE_DATE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.W_INSERT_DT = null; } else {
      this.W_INSERT_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.INTEGRATION_ID = null; } else {
      this.INTEGRATION_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ROW_WID = null; } else {
      this.ROW_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.VERSION = null; } else {
      this.VERSION = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.DATE_FROM = null; } else {
      this.DATE_FROM = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.DATE_TO = null; } else {
      this.DATE_TO = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LONGITUDE = null; } else {
      this.LONGITUDE = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LATITUDE = null; } else {
      this.LATITUDE = new java.math.BigDecimal(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    W_SL_REQUEST_TYPE_D_1 o = (W_SL_REQUEST_TYPE_D_1) super.clone();
    o.START_DATE_ACTIVE = (o.START_DATE_ACTIVE != null) ? (java.sql.Timestamp) o.START_DATE_ACTIVE.clone() : null;
    o.END_DATE_ACTIVE = (o.END_DATE_ACTIVE != null) ? (java.sql.Timestamp) o.END_DATE_ACTIVE.clone() : null;
    o.LAST_UPDATE_DATE = (o.LAST_UPDATE_DATE != null) ? (java.sql.Timestamp) o.LAST_UPDATE_DATE.clone() : null;
    o.W_INSERT_DT = (o.W_INSERT_DT != null) ? (java.sql.Timestamp) o.W_INSERT_DT.clone() : null;
    o.DATE_FROM = (o.DATE_FROM != null) ? (java.sql.Timestamp) o.DATE_FROM.clone() : null;
    o.DATE_TO = (o.DATE_TO != null) ? (java.sql.Timestamp) o.DATE_TO.clone() : null;
    return o;
  }

  public void clone0(W_SL_REQUEST_TYPE_D_1 o) throws CloneNotSupportedException {
    o.START_DATE_ACTIVE = (o.START_DATE_ACTIVE != null) ? (java.sql.Timestamp) o.START_DATE_ACTIVE.clone() : null;
    o.END_DATE_ACTIVE = (o.END_DATE_ACTIVE != null) ? (java.sql.Timestamp) o.END_DATE_ACTIVE.clone() : null;
    o.LAST_UPDATE_DATE = (o.LAST_UPDATE_DATE != null) ? (java.sql.Timestamp) o.LAST_UPDATE_DATE.clone() : null;
    o.W_INSERT_DT = (o.W_INSERT_DT != null) ? (java.sql.Timestamp) o.W_INSERT_DT.clone() : null;
    o.DATE_FROM = (o.DATE_FROM != null) ? (java.sql.Timestamp) o.DATE_FROM.clone() : null;
    o.DATE_TO = (o.DATE_TO != null) ? (java.sql.Timestamp) o.DATE_TO.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("LOOKUP_CODE", this.LOOKUP_CODE);
    __sqoop$field_map.put("MEANING", this.MEANING);
    __sqoop$field_map.put("DESCRIPTION", this.DESCRIPTION);
    __sqoop$field_map.put("ENABLED_FLAG", this.ENABLED_FLAG);
    __sqoop$field_map.put("START_DATE_ACTIVE", this.START_DATE_ACTIVE);
    __sqoop$field_map.put("END_DATE_ACTIVE", this.END_DATE_ACTIVE);
    __sqoop$field_map.put("LAST_UPDATE_DATE", this.LAST_UPDATE_DATE);
    __sqoop$field_map.put("W_INSERT_DT", this.W_INSERT_DT);
    __sqoop$field_map.put("INTEGRATION_ID", this.INTEGRATION_ID);
    __sqoop$field_map.put("ROW_WID", this.ROW_WID);
    __sqoop$field_map.put("VERSION", this.VERSION);
    __sqoop$field_map.put("DATE_FROM", this.DATE_FROM);
    __sqoop$field_map.put("DATE_TO", this.DATE_TO);
    __sqoop$field_map.put("LONGITUDE", this.LONGITUDE);
    __sqoop$field_map.put("LATITUDE", this.LATITUDE);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("LOOKUP_CODE", this.LOOKUP_CODE);
    __sqoop$field_map.put("MEANING", this.MEANING);
    __sqoop$field_map.put("DESCRIPTION", this.DESCRIPTION);
    __sqoop$field_map.put("ENABLED_FLAG", this.ENABLED_FLAG);
    __sqoop$field_map.put("START_DATE_ACTIVE", this.START_DATE_ACTIVE);
    __sqoop$field_map.put("END_DATE_ACTIVE", this.END_DATE_ACTIVE);
    __sqoop$field_map.put("LAST_UPDATE_DATE", this.LAST_UPDATE_DATE);
    __sqoop$field_map.put("W_INSERT_DT", this.W_INSERT_DT);
    __sqoop$field_map.put("INTEGRATION_ID", this.INTEGRATION_ID);
    __sqoop$field_map.put("ROW_WID", this.ROW_WID);
    __sqoop$field_map.put("VERSION", this.VERSION);
    __sqoop$field_map.put("DATE_FROM", this.DATE_FROM);
    __sqoop$field_map.put("DATE_TO", this.DATE_TO);
    __sqoop$field_map.put("LONGITUDE", this.LONGITUDE);
    __sqoop$field_map.put("LATITUDE", this.LATITUDE);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
