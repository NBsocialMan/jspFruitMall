package xgbb.entity;

import java.util.List;

public class MyPage<T> {
    private Integer notesTotal; //总记录条数
    private Integer pageTotal;  //总页数
    private Integer currentPage; //当前页
    private Integer pageNotesCount;  //页记录条数

    List<T> list; //集合

    public MyPage() {
    }

    public MyPage(Integer notesTotal, Integer pageTotal, Integer currentPage, Integer pageNotesCount, List<T> list) {
        this.notesTotal = notesTotal;
        this.pageTotal = pageTotal;
        this.currentPage = currentPage;
        this.pageNotesCount = pageNotesCount;
        this.list = list;
    }

    public Integer getNotesTotal() {
        return notesTotal;
    }

    public void setNotesTotal(Integer notesTotal) {
        this.notesTotal = notesTotal;
    }

    public Integer getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(Integer pageTotal) {
        this.pageTotal = pageTotal;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageNotesCount() {
        return pageNotesCount;
    }

    public void setPageNotesCount(Integer pageNotesCount) {
        this.pageNotesCount = pageNotesCount;
    }

    @Override
    public String toString() {
        return "MyPage{" +
                "notesTotal=" + notesTotal +
                ", pageTotal=" + pageTotal +
                ", currentPage=" + currentPage +
                ", pageNotesCount=" + pageNotesCount +
                ", list=" + list +
                '}';
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
