package com.pojo;

public class Page {
    //	默认为查询第一页
    private int curPage=1;
    //	默认一页十条记录
    private int pageRows=10;

    private int totalRows;

    private int totalPages;

    private int startRow;

    private int endRow;


    public Page() {}
    public Page(int curPage) {
        super();
        this.curPage = curPage >= 0 ? curPage : 1;
    }
    public Page(int curPage,int pageRows) {
        super();
        this.curPage = curPage >= 0 ? curPage : 1;
        this.pageRows = pageRows > 0 ? pageRows : 10;
    }


    public int getCurPage() {
        return curPage;
    }
    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }
    public int getPageRows() {
        return pageRows;
    }
    public void setPageRows(int pageRows) {
        this.pageRows = pageRows;
    }

    public int getTotalRows() {
        return totalRows;
    }
    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }


    public int getStartRow() {
        return this.pageRows*(this.curPage-1);
    }

    public int getEndRow() {
        return this.startRow+this.pageRows;
    }

    public int getTotalPages() {
        return this.totalRows/(this.pageRows+1)+1;
    }
    
    
    
	@Override
	public String toString() {
		return "Page [curPage=" + curPage + ", pageRows=" + pageRows + ", totalRows=" + totalRows + ", totalPages="
				+ totalPages + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
}